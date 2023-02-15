locals {
    tags = {
        owner = "Daniel Slosky"
        project = "Networking TF Practice"
        Name = "Networking-TF-Practice"
    }
}

module "vpc" {
    source = "./modules/vpc"
    tags = local.tags
}

module "subnets" {
    source = "./modules/subnets"
    tags = local.tags
    vpc_id = module.vpc.main_vpc_id
}

module "route_table" {
    source = "./modules/routes"
    tags = local.tags
    vpc_id = module.vpc.main_vpc_id
    igw_id = module.vpc.internet_gateway_id
    public_subnets = module.subnets.public_ids
    private_subnets = module.subnets.private_ids
}

module "app" {
    source = "./modules/app"
    tags = local.tags
    public_subnet = module.subnets.public

}
