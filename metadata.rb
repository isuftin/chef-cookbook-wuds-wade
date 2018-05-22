name 'wade'
maintainer 'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license 'CPL-1.0'
description 'Creates a WaDE web server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version '1.0.0'

issues_url 'https://github.com/USGS-CIDA/chef-cookbook-wuds-wade/issues'
source_url 'https://github.com/USGS-CIDA/chef-cookbook-wuds-wade'
chef_version '>= 12.0.0'
supports 'centos', '~> 6.8'

depends 'httpd'
depends 'php'
