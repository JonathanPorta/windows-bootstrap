# TODO: Abstract this config to make it easier to install on other server types
cookbook_path ['/ogs/cookbooks/']

log_level :debug
verbose_logging true

# Verify all HTTPS connections (recommended)
ssl_verify_mode :verify_peer
