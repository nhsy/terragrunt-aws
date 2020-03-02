output "random_id" {
  value = random_id.this.hex
}

output "common_tags" {
  value = module.common_tags.rendered
}

output "ssh_key_name" {
  value = aws_key_pair.ssh_key.key_name
}
