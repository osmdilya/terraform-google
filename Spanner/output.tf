output "config" {
	value = [
		google_spanner_instance.main.id,
		google_spanner_instance.main.state,
		google_spanner_database.database.name
	]
}