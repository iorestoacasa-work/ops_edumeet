# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
# variable "hcloud_token" {}

# Configure the Hetzner Cloud Provider
# provider "hcloud" {
#  token = "${var.hcloud_token}"
# }

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = "YOUR HETZNER TOKEN HERE"
}

# Create a server
resource "hcloud_server" "edumeet" {
  count = 2
  name = "edumeet-${count.index}.lab.iorestoacasa.work"
  image = "debian-10"
  server_type = "cx31"
  ssh_keys = ["fero@highlander", "tapion@tapion.it"]
  location = "nbg1"
  # description = "Edumeet instance nr. ${count.index}"
}

