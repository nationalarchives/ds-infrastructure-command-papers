# the targets are available after EKS deployment; when deploying without K8s in place use dummy value;
# the zone id for dev.local need to be automated (value from parameter store
# lb_zone_id can be extracted when load balancer has been created.

site_domain = "commandpapers.nationalarchives.gov.uk"
site_target = ""
lb_zone_id = ""

local_zone_id = "Z0908079JT6PK81GYP0V"
local_api_domain = "commandpaper-api.live.local"
local_api_target = ""
