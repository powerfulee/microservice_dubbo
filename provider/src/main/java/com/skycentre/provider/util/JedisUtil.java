package com.skycentre.provider.util;

import java.util.HashMap;
import java.util.Map;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtil {

	static Map<String, JedisPool> maps = new HashMap<String, JedisPool>();

	private static JedisUtil instance = new JedisUtil();

	/**
	 * 私有构造器.
	 */
	private JedisUtil() {

	}

	final static String ip = ConfigUtil.getRedisIpAddress();
	final static int port = 6379;
	final static String auth = ConfigUtil.getRedisPassword();

	final static int maxactive = 1024;
	final static int maxidle = 200;
	final static int maxwait = 10000;
	final static int timeout = 10000;

	/**
	 * 当getInstance方法第一次被调用的时候，它第一次读取
	 * RedisUtilHolder.instance，导致RedisUtilHolder类得到初始化；而这个类在装载并被初始化的时候，会初始化它的静
	 * 态域，从而创建RedisUtil的实例，由于是静态的域，因此只会在虚拟机装载类的时候初始化一次，并由虚拟机来保证它的线程安全性。
	 * 这个模式的优势在于，getInstance方法并没有被同步，并且只是执行一个域的访问，因此延迟初始化并没有增加任何访问成本。
	 */
	public static JedisUtil getInstance() {
		if (instance == null) {
			instance = new JedisUtil();
		}
		return instance;
	}

	class BaseConfig {
		final static int retryNum = 3;

	}

	public Jedis getJedis() {
		return getJedis(ip, port, auth,0);
	}

	public Jedis getJedis(int db) {
		return getJedis(ip, port, auth,db);
	}
	
	public Jedis getJedis(String ip, int port, String auth) {
		return getJedis(ip, port, auth, 0);
	}
	
	public Jedis getJedis(String ip, int port, String auth,int db) {
		Jedis jedis = null;
		int count = 0;
		do {
			try {
				jedis = getPool(ip, port, auth,db).getResource();
				// log.info("get redis master1!");
			} catch (Exception e) {
				// 销毁对象
				getPool(ip, port, auth,db).returnBrokenResource(jedis);
			}
			count++;
		} while (jedis == null && count < BaseConfig.retryNum);
		return jedis;
	}

	private static JedisPool getPool(String ip, int port, String auth) {
		return getPool(ip, port, auth, 0);
	}
	
	private static JedisPool getPool(String ip, int port, String auth,int db) {
		String key = ip + ":" + port;
		JedisPool pool = null;
		if (!maps.containsKey(key)) {
			JedisPoolConfig config = new JedisPoolConfig();
			config.setMaxActive(maxactive);
			config.setMaxIdle(maxidle);
			config.setMaxWait(maxwait);
			config.setTestOnBorrow(true);
			config.setTestOnReturn(true);
			try {
				/**
				 * 如果你遇到 java.net.SocketTimeoutException: Read timed out
				 * exception的异常信息 请尝试在构造JedisPool的时候设置自己的超时值.
				 * JedisPool默认的超时时间是2秒(单位毫秒)
				 */
				if (auth == null || auth.trim().equals("")) {
					pool = new JedisPool(config, ip, port, timeout,null,db);
				} else {
					pool = new JedisPool(config, ip, port, timeout, auth,db);
				}

				maps.put(key, pool);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pool = maps.get(key);
		}
		return pool;
	}

	/**
	 * 释放redis实例到连接池.
	 * 
	 * @param jedis
	 *            redis实例
	 */
	public static void closeJedis(Jedis jedis, String ip, int port, String auth) {
		if (jedis != null) {
			getPool(ip, port, auth).returnResource(jedis);
		}
	}

	/**
	 * 释放redis实例到连接池.
	 * 
	 * @param jedis
	 *            redis实例
	 */
	public static void closeJedis(Jedis jedis) {
		closeJedis(jedis, ip, port, auth);
	}

	/**
	 * 清除key
	 * 
	 * @param keys
	 */
	public void del(String... keys) {
		Jedis jedis = getJedis();
		try {
			jedis.del(keys);
		} finally {
			closeJedis(jedis);
		}
	}

	/**
	 * 清除hash里的元素
	 * 
	 * @param key
	 * @param fields
	 */
	public void hdel(String key, String... fields) {
		Jedis jedis = getJedis();
		try {
			jedis.hdel(key, fields);
		} finally {
			closeJedis(jedis);
		}
	}

	public static void main(String[] args) {

		Jedis jedis = JedisUtil.getInstance().getJedis();
		JedisUtil.closeJedis(jedis);

	}
}
