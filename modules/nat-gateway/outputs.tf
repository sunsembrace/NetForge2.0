output "nat_gateway_ids" {
  value       = aws_nat_gateway.public_nat[*].id
  description = "List of NAT Gateway IDs"
}

output "nat_eip_ids" {
  value       = aws_eip.nat_eip[*].id
  description = "List of Elastic IPs attached to the NAT Gateways"
}
