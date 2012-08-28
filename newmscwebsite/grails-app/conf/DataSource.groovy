dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQLDialect
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/mscmsc"
			username = "root"
			password = "uni-dev"
		}
	}
	test {
		dataSource {
			dialect = "org.hibernate.dialect.H2Dialect"
			dbCreate = "create-drop"
			url = "jdbc:h2:mem:testDb;MVCC=TRUE"
		}
	}
	production {
		dataSource {
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://mscmsc.clchcirmqiuh.us-west-1.rds.amazonaws.com/mscmsc"
			username = "root"
			password = "uni-dev01"
			dialect = org.hibernate.dialect.MySQLDialect
			properties {
				validationQuery = "SELECT 1"
				testOnBorrow = true
				testOnReturn = true
				testWhileIdle = true
				timeBetweenEvictionRunsMillis = 1000 * 60 * 30
				numTestsPerEvictionRun = 3
				minEvictableIdleTimeMillis = 1000 * 60 * 30
			}
		}
	}
}
