# the targets are available after EKS deployment; when deploying without K8s in place use dummy value;
# the zone id for dev.local need to be automated (value from parameter store
# lb_zone_id can be extracted when load balancer has been created.

site_domain = "commandpapers.nationalarchives.gov.uk"
site_target = "k8s-commandp-commandp-612808c8d8-1331309842.eu-west-2.elb.amazonaws.com"
lb_zone_id = "ZHURV8PSTC4K8"

local_zone_id = "Z0908079JT6PK81GYP0V"
local_api_domain = "commandpaper-api.live.local"
local_api_target = "internal-k8s-commandp-commandp-8bfd8f7ef3-1754095049.eu-west-2.elb.amazonaws.com"
