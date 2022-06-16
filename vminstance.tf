
resource "google_compute_instance" "default" {
  name         = "cf-terraform-1"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20211209"
    }
  }
  
  
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "420343827558-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  
  deletion_protection = false
  desired_status = "RUNNING"
  
  tags= ["vpc1", "vpc2"]

  scheduling {
    automatic_restart   = false
  }

  
  
  metadata = {
      ssh-keys = true
  }
  
  shielded_instance_config{
      enable_secure_boot = true
      enable_vtpm = false
      enable_integrity_monitoring = false
      
  }

  enable_display = true 

  

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
