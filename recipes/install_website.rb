#
# Cookbook Name:: wade
# Recipe:: install_website
# Description:: Installs the WaDE website

yum_repository 'USGS_WATER_RPM' do
  baseurl node['wade']['yum']['repo']['baseurl']
  description 'USGS Water RPM Server'
  gpgcheck false
  action :create
end

package 'Install WaDE RPM' do
  package_name 'wade-web'
  arch 'noarch'
  version node['wade']['web']['version'] if node['wade']['web']['version'] != ''
end
