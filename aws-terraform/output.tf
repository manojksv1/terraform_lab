output "private-subnet-ids" {
  value = module.vpc.private-subnet
}

output "public-subnet-ids" {
  value = module.vpc.public-subnet
}
