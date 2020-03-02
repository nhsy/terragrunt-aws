####
# Management External IP
###

data "http" "mgmt_ip" {
  url = "https://ipinfo.io/ip"
}
