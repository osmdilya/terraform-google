output "config" {
	value = [
		google_bigquery_table.sheet.table_id
	]
}
