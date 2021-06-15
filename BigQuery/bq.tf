resource "google_bigquery_dataset" "default" {
	dataset_id = var.config["friendly_name"]
	friendly_name = var.config["friendly_name"]
	description = "This is a test description"
	location = var.config["location"]
	default_table_expiration_ms = 3600000
	labels = {
		env = "default"
	}
}
resource "google_bigquery_table" "sheet" {
	dataset_id = google_bigquery_dataset.default.dataset_id
	deletion_protection = false
	table_id = "sheet"
	external_data_configuration {
		autodetect = true
		source_format = var.config["source_format"]
		google_sheets_options {
		skip_leading_rows = 1
	}
	source_uris = [ var.config["source_uris"] ]
	}
}

variable "config" {
	type = map(any)
}
