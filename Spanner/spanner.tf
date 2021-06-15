resource "google_spanner_instance" "main" {
	config = var.config["config"]
	display_name = var.config["display_name"]
}
resource "google_spanner_database" "database" {
	instance = google_spanner_instance.main.name
	name = var.config["name"]
	ddl = var.databases
	deletion_protection = false
}


variable "config" {
	type = map(any)
	
}
variable "databases" {
	type = list(any)
	
}
