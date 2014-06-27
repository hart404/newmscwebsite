dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQLDialect
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
	format_sql = true
	use_sql_comments = true
}
// environment specific settings
environments {
	development {
		dataSource {
			url = "jdbc:mysql://localhost/mscmsc"
			username = "root"
			password = "uni-dev"
			dbCreate = "update"
		}
	}
	test {
		dataSource {
			dialect = "org.hibernate.dialect.H2Dialect"
			dbCreate = "create-drop"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            driverClassName = "org.h2.Driver"
            username = "sa"
            password = ""
		}
	}
	production {
		dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://mscmsc.clchcirmqiuh.us-west-1.rds.amazonaws.com/mscmsc"
			username = "root"
			password = "uni-dev01"
			dialect = org.hibernate.dialect.MySQLDialect
			dbCreate = "update"
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
	backup {
		dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://mscmscbackup.clchcirmqiuh.us-west-1.rds.amazonaws.com/mscmsc"
			username = "root"
			password = "uni-dev01"
			dialect = org.hibernate.dialect.MySQLDialect
			dbCreate = "update"
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
