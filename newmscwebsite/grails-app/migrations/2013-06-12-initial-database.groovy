databaseChangeLog = {

	changeSet(author: "hart404 (generated)", id: "1371147826656-1") {
		dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "apartment", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-2") {
		dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "recipient_email", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-3") {
		dropNotNullConstraint(columnDataType: "bigint", columnName: "selectedecard_id", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-4") {
		dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "title", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-5") {
		dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "tribute_body", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-6") {
		dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "tribute_subject", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-7") {
		dropForeignKeyConstraint(baseTableName: "scmshard_coded_page", baseTableSchemaName: "mscmsc", constraintName: "FK888872D543584F00")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-8") {
		dropForeignKeyConstraint(baseTableName: "scmshard_coded_page_scmswidget", baseTableSchemaName: "mscmsc", constraintName: "FKF8920D64ACA1751B")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-9") {
		dropForeignKeyConstraint(baseTableName: "scmsmenu_item", baseTableSchemaName: "mscmsc", constraintName: "FKE5E76EBD49CE1BA4")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-10") {
		dropForeignKeyConstraint(baseTableName: "sec_user", baseTableSchemaName: "mscmsc", constraintName: "FK375DF2F943ACCD93")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-11") {
		dropIndex(indexName: "uri", tableName: "scmshard_coded_page")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-12") {
		dropColumn(columnName: "donation_amount", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-13") {
		dropColumn(columnName: "name", tableName: "donation")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-14") {
		dropColumn(columnName: "event_priority", tableName: "event")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-15") {
		dropColumn(columnName: "photo", tableName: "news_item")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-16") {
		dropColumn(columnName: "menu_bar_id", tableName: "scmsmenu_item")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-17") {
		dropColumn(columnName: "menu_items_idx", tableName: "scmsmenu_item")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-18") {
		dropColumn(columnName: "menus_idx", tableName: "scmsmenu_item")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-19") {
		dropColumn(columnName: "hide_photo", tableName: "scmswidget")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-20") {
		dropColumn(columnName: "cltposition", tableName: "sec_user")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-21") {
		dropColumn(columnName: "email", tableName: "sec_user")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-22") {
		dropColumn(columnName: "photo_location_id", tableName: "sec_user")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-23") {
		dropColumn(columnName: "hikes_idx", tableName: "trailhead_hike")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-24") {
		dropTable(tableName: "scmshard_coded_page")
	}

	changeSet(author: "hart404 (generated)", id: "1371147826656-25") {
		dropTable(tableName: "scmshard_coded_page_scmswidget")
	}
}
