package com.stock.core.db;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

	private static final Logger logger = LoggerFactory.getLogger(DynamicDataSource.class);

	@Override
	protected Object determineCurrentLookupKey() {
		Object object = DynamicDataSourceKeyHolder.getDataSourceKey();
		logger.debug("determineCurrentLookupKey:" + object);
		return object;
	}

}
