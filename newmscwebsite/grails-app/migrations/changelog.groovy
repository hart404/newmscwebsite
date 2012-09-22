databaseChangeLog = {

	changeSet(author: "hart404 (generated)", id: "1348180462471-1") {
		createTable(tableName: "event") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "end_time", type: "DATETIME")

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "location_id", type: "BIGINT")

			column(name: "main_photo_id", type: "BIGINT")

			column(name: "more_information", type: "LONGTEXT")

			column(name: "short_description", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "show_on_home_page", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "start_date", type: "DATE")

			column(name: "start_time", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "steward_only", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "other_location", type: "VARCHAR(255)")

			column(name: "event_priority", type: "INT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-2") {
		createTable(tableName: "event_categories") {
			column(name: "event_id", type: "BIGINT")

			column(name: "category", type: "VARCHAR(255)")

			column(name: "categories_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-3") {
		createTable(tableName: "event_person") {
			column(name: "event_attendees_id", type: "BIGINT")

			column(name: "person_id", type: "BIGINT")

			column(name: "attendees_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-4") {
		createTable(tableName: "event_scmsphoto") {
			column(name: "event_additional_photos_id", type: "BIGINT")

			column(name: "scmsphoto_id", type: "BIGINT")

			column(name: "additional_photos_idx", type: "INT")

			column(name: "event_photos_id", type: "BIGINT")

			column(name: "photos_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-5") {
		createTable(tableName: "geographic_coordinates") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "latitude", type: "DECIMAL(19,2)") {
				constraints(nullable: "false")
			}

			column(name: "longitude", type: "DECIMAL(19,2)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-6") {
		createTable(tableName: "hike") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "directions", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "elevation_gain", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "elevation_profile", type: "VARCHAR(255)")

			column(name: "kml_file_name", type: "VARCHAR(255)")

			column(name: "name", type: "VARCHAR(50)") {
				constraints(nullable: "false")
			}

			column(name: "noteworthy_features", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "round_trip_distance", type: "DECIMAL(4,2)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-7") {
		createTable(tableName: "news_item") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "display_end_date", type: "DATE") {
				constraints(nullable: "false")
			}

			column(name: "display_start_date", type: "DATE") {
				constraints(nullable: "false")
			}

			column(name: "important", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "more_information", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "photo_id", type: "BIGINT")

			column(name: "summary", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "VARCHAR(100)") {
				constraints(nullable: "false")
			}

			column(name: "photo", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-8") {
		createTable(tableName: "note") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-9") {
		createTable(tableName: "phone") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "number", type: "VARCHAR(30)")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-10") {
		createTable(tableName: "registration_code") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "token", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-11") {
		createTable(tableName: "scmsad_space_photo") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "VARCHAR(255)")

			column(name: "display_end_date", type: "DATE") {
				constraints(nullable: "false")
			}

			column(name: "display_start_date", type: "DATE") {
				constraints(nullable: "false")
			}

			column(name: "link", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "photo_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-12") {
		createTable(tableName: "scmsgallery_widget_scmsphoto_widget") {
			column(name: "scmsgallery_widget_photo_widgets_id", type: "BIGINT")

			column(name: "scmsphoto_widget_id", type: "BIGINT")

			column(name: "photo_widgets_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-13") {
		createTable(tableName: "scmshard_coded_page") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "uri", type: "VARCHAR(40)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "template_id", type: "BIGINT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-14") {
		createTable(tableName: "scmshard_coded_page_scmswidget") {
			column(name: "scmshard_coded_page_widgets_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "scmswidget_id", type: "BIGINT")

			column(name: "widgets_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-15") {
		createTable(tableName: "scmslightbox_widget_scmsphoto_widget") {
			column(name: "scmslightbox_widget_photo_widgets_id", type: "BIGINT")

			column(name: "scmsphoto_widget_id", type: "BIGINT")

			column(name: "photo_widgets_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-16") {
		createTable(tableName: "scmsmenu_bar") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "widget_id", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-17") {
		createTable(tableName: "scmsmenu_bar_scmsmenu") {
			column(name: "scmsmenu_bar_menus_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "scmsmenu_id", type: "BIGINT")

			column(name: "menus_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-18") {
		createTable(tableName: "scmsmenu_item") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "link", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "menu_bar_id", type: "BIGINT")

			column(name: "menus_idx", type: "INT")

			column(name: "menu_items_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-19") {
		createTable(tableName: "scmsmenu_item_roles") {
			column(name: "scmsmenu_item_id", type: "BIGINT")

			column(name: "roles_string", type: "VARCHAR(255)")

			column(name: "roles_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-20") {
		createTable(tableName: "scmsmenu_link") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "link", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "menu_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-21") {
		createTable(tableName: "scmsmenu_scmsmenu_item") {
			column(name: "scmsmenu_menu_items_id", type: "BIGINT")

			column(name: "scmsmenu_item_id", type: "BIGINT")

			column(name: "menu_items_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-22") {
		createTable(tableName: "scmspage_template") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "associatedgsp", type: "VARCHAR(40)") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "LONGTEXT")

			column(name: "name", type: "VARCHAR(100)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-23") {
		createTable(tableName: "scmspage_template_scmswidget_creator") {
			column(name: "scmspage_template_widget_creators_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "scmswidget_creator_id", type: "BIGINT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-24") {
		createTable(tableName: "scmsphoto") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "all_keywords", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "artist", type: "VARCHAR(255)")

			column(name: "copyright", type: "VARCHAR(255)")

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "LONGTEXT")

			column(name: "file_name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "height", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "original_file_name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "path", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "source", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "usage_rights", type: "VARCHAR(255)")

			column(name: "width", type: "INT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-25") {
		createTable(tableName: "scmsstatic_page") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "link", type: "VARCHAR(40)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "template_id", type: "BIGINT")

			column(name: "title", type: "VARCHAR(100)")

			column(name: "description_metadata", type: "VARCHAR(255)")

			column(name: "keywords_metadata", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-26") {
		createTable(tableName: "scmsstatic_page_scmswidget") {
			column(name: "scmsstatic_page_widgets_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "scmswidget_id", type: "BIGINT")

			column(name: "widgets_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-27") {
		createTable(tableName: "scmswidget") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "css_class", type: "VARCHAR(255)")

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "widget_id", type: "VARCHAR(30)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "html_text", type: "LONGTEXT")

			column(name: "caption", type: "VARCHAR(255)")

			column(name: "photo_id", type: "BIGINT")

			column(name: "link_photo_id", type: "BIGINT")

			column(name: "title", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-28") {
		createTable(tableName: "scmswidget_creator") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "widget_id", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-29") {
		createTable(tableName: "sec_role") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-30") {
		createTable(tableName: "sec_user") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "BIT") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "address_city", type: "VARCHAR(30)")

			column(name: "address_state", type: "VARCHAR(2)")

			column(name: "address_street", type: "VARCHAR(70)")

			column(name: "address_zip", type: "VARCHAR(10)")

			column(name: "cell_phone_number", type: "VARCHAR(30)")

			column(name: "emergency_contact", type: "VARCHAR(255)")

			column(name: "emergency_phone", type: "VARCHAR(255)")

			column(name: "emergency_relationship", type: "VARCHAR(255)")

			column(name: "first_name", type: "VARCHAR(30)")

			column(name: "home_phone_number", type: "VARCHAR(30)")

			column(name: "last_name", type: "VARCHAR(50)")

			column(name: "master_steward", type: "BIT")

			column(name: "middle_initial", type: "VARCHAR(4)")

			column(name: "photo_id", type: "BIGINT")

			column(name: "position", type: "VARCHAR(255)")

			column(name: "tshirt_size", type: "VARCHAR(3)")

			column(name: "wants_weekly_email", type: "BIT")

			column(name: "class_number", type: "VARCHAR(255)")

			column(name: "email", type: "VARCHAR(255)")

			column(name: "cltposition", type: "VARCHAR(255)")

			column(name: "photo_location_id", type: "BIGINT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-31") {
		createTable(tableName: "sec_user_sec_role") {
			column(name: "sec_role_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "sec_user_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-32") {
		createTable(tableName: "street_address") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "city", type: "VARCHAR(30)") {
				constraints(nullable: "false")
			}

			column(name: "state", type: "VARCHAR(2)") {
				constraints(nullable: "false")
			}

			column(name: "street", type: "VARCHAR(70)") {
				constraints(nullable: "false")
			}

			column(name: "zip", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-33") {
		createTable(tableName: "tag_links") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "tag_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "tag_ref", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "type", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-34") {
		createTable(tableName: "tags") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-35") {
		createTable(tableName: "trailhead") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "address_city", type: "VARCHAR(30)") {
				constraints(nullable: "false")
			}

			column(name: "address_state", type: "VARCHAR(2)") {
				constraints(nullable: "false")
			}

			column(name: "address_street", type: "VARCHAR(70)") {
				constraints(nullable: "false")
			}

			column(name: "address_zip", type: "VARCHAR(10)") {
				constraints(nullable: "false")
			}

			column(name: "coordinates_latitude", type: "DECIMAL(19,6)") {
				constraints(nullable: "false")
			}

			column(name: "coordinates_longitude", type: "DECIMAL(19,6)") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "LONGTEXT") {
				constraints(nullable: "false")
			}

			column(name: "internal_name", type: "VARCHAR(20)") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "VARCHAR(100)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-36") {
		createTable(tableName: "trailhead_activities") {
			column(name: "trailhead_id", type: "BIGINT")

			column(name: "activity", type: "VARCHAR(255)")

			column(name: "activities_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-37") {
		createTable(tableName: "trailhead_amenities") {
			column(name: "trailhead_id", type: "BIGINT")

			column(name: "amenity", type: "VARCHAR(255)")

			column(name: "amenities_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-38") {
		createTable(tableName: "trailhead_hike") {
			column(name: "trailhead_hikes_id", type: "BIGINT")

			column(name: "hike_id", type: "BIGINT")

			column(name: "hikes_idx", type: "INT")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-39") {
		addPrimaryKey(columnNames: "sec_role_id, sec_user_id", tableName: "sec_user_sec_role")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-40") {
		addForeignKeyConstraint(baseColumnNames: "location_id", baseTableName: "event", baseTableSchemaName: "mscmsc", constraintName: "FK5C6729AF307D0DB", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "trailhead", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-41") {
		addForeignKeyConstraint(baseColumnNames: "main_photo_id", baseTableName: "event", baseTableSchemaName: "mscmsc", constraintName: "FK5C6729ADBB5EC49", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-42") {
		addForeignKeyConstraint(baseColumnNames: "person_id", baseTableName: "event_person", baseTableSchemaName: "mscmsc", constraintName: "FK393DE49A449258A", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "sec_user", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-43") {
		addForeignKeyConstraint(baseColumnNames: "scmsphoto_id", baseTableName: "event_scmsphoto", baseTableSchemaName: "mscmsc", constraintName: "FK2E267497FC1CD279", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-44") {
		addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "news_item", baseTableSchemaName: "mscmsc", constraintName: "FK11ED74FF54DB6083", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-45") {
		addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "scmsad_space_photo", baseTableSchemaName: "mscmsc", constraintName: "FK2737251354DB6083", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-46") {
		addForeignKeyConstraint(baseColumnNames: "scmsphoto_widget_id", baseTableName: "scmsgallery_widget_scmsphoto_widget", baseTableSchemaName: "mscmsc", constraintName: "FK7DB4DBDF77E090D2", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmswidget", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-47") {
		addForeignKeyConstraint(baseColumnNames: "template_id", baseTableName: "scmshard_coded_page", baseTableSchemaName: "mscmsc", constraintName: "FK888872D543584F00", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmspage_template", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-48") {
		addForeignKeyConstraint(baseColumnNames: "scmswidget_id", baseTableName: "scmshard_coded_page_scmswidget", baseTableSchemaName: "mscmsc", constraintName: "FKF8920D64ACA1751B", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmswidget", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-49") {
		addForeignKeyConstraint(baseColumnNames: "scmsphoto_widget_id", baseTableName: "scmslightbox_widget_scmsphoto_widget", baseTableSchemaName: "mscmsc", constraintName: "FKBF004B2E77E090D2", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmswidget", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-50") {
		addForeignKeyConstraint(baseColumnNames: "scmsmenu_id", baseTableName: "scmsmenu_bar_scmsmenu", baseTableSchemaName: "mscmsc", constraintName: "FKD5FF36AB19EEDF7B", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsmenu_item", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-51") {
		addForeignKeyConstraint(baseColumnNames: "menu_bar_id", baseTableName: "scmsmenu_item", baseTableSchemaName: "mscmsc", constraintName: "FKE5E76EBD49CE1BA4", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsmenu_bar", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-52") {
		addForeignKeyConstraint(baseColumnNames: "menu_id", baseTableName: "scmsmenu_link", baseTableSchemaName: "mscmsc", constraintName: "FKE5E8A3A4F3816831", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsmenu_item", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-53") {
		addForeignKeyConstraint(baseColumnNames: "scmsmenu_item_id", baseTableName: "scmsmenu_scmsmenu_item", baseTableSchemaName: "mscmsc", constraintName: "FK8AF7FA53E6AB0E46", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsmenu_item", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-54") {
		addForeignKeyConstraint(baseColumnNames: "scmspage_template_widget_creators_id", baseTableName: "scmspage_template_scmswidget_creator", baseTableSchemaName: "mscmsc", constraintName: "FKE73AF4D27D54BF43", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmspage_template", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-55") {
		addForeignKeyConstraint(baseColumnNames: "scmswidget_creator_id", baseTableName: "scmspage_template_scmswidget_creator", baseTableSchemaName: "mscmsc", constraintName: "FKE73AF4D2D5404204", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmswidget_creator", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-56") {
		addForeignKeyConstraint(baseColumnNames: "template_id", baseTableName: "scmsstatic_page", baseTableSchemaName: "mscmsc", constraintName: "FKEDB3E40A43584F00", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmspage_template", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-57") {
		addForeignKeyConstraint(baseColumnNames: "scmswidget_id", baseTableName: "scmsstatic_page_scmswidget", baseTableSchemaName: "mscmsc", constraintName: "FK3C4D390FACA1751B", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmswidget", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-58") {
		addForeignKeyConstraint(baseColumnNames: "link_photo_id", baseTableName: "scmswidget", baseTableSchemaName: "mscmsc", constraintName: "FKE2C8D1BA365B3B28", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-59") {
		addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "scmswidget", baseTableSchemaName: "mscmsc", constraintName: "FKE2C8D1BA54DB6083", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-60") {
		addForeignKeyConstraint(baseColumnNames: "photo_id", baseTableName: "sec_user", baseTableSchemaName: "mscmsc", constraintName: "FK375DF2F954DB6083", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-61") {
		addForeignKeyConstraint(baseColumnNames: "photo_location_id", baseTableName: "sec_user", baseTableSchemaName: "mscmsc", constraintName: "FK375DF2F943ACCD93", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "scmsphoto", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-62") {
		addForeignKeyConstraint(baseColumnNames: "sec_role_id", baseTableName: "sec_user_sec_role", baseTableSchemaName: "mscmsc", constraintName: "FK6630E2A7301460D", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "sec_role", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-63") {
		addForeignKeyConstraint(baseColumnNames: "sec_user_id", baseTableName: "sec_user_sec_role", baseTableSchemaName: "mscmsc", constraintName: "FK6630E2A182C09ED", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "sec_user", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-64") {
		addForeignKeyConstraint(baseColumnNames: "tag_id", baseTableName: "tag_links", baseTableSchemaName: "mscmsc", constraintName: "FK7C35D6D45A3B441D", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "tags", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-65") {
		addForeignKeyConstraint(baseColumnNames: "hike_id", baseTableName: "trailhead_hike", baseTableSchemaName: "mscmsc", constraintName: "FK8CE169D445F23CA", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "hike", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-66") {
		addForeignKeyConstraint(baseColumnNames: "trailhead_hikes_id", baseTableName: "trailhead_hike", baseTableSchemaName: "mscmsc", constraintName: "FK8CE169D4DA022F31", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "trailhead", referencedTableSchemaName: "mscmsc", referencesUniqueColumn: "false")
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-67") {
		createIndex(indexName: "uri", tableName: "scmshard_coded_page", unique: "true") {
			column(name: "uri")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-68") {
		createIndex(indexName: "widget_id", tableName: "scmsmenu_bar", unique: "true") {
			column(name: "widget_id")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-69") {
		createIndex(indexName: "link", tableName: "scmsstatic_page", unique: "true") {
			column(name: "link")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-70") {
		createIndex(indexName: "authority", tableName: "sec_role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-71") {
		createIndex(indexName: "username", tableName: "sec_user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "hart404 (generated)", id: "1348180462471-72") {
		createIndex(indexName: "name", tableName: "tags", unique: "true") {
			column(name: "name")
		}
	}
}
