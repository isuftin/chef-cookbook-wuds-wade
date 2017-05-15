#
# Cookbook Name:: wade
# Recipe:: install_website
# Description:: Installs the WaDE website

package 'Install WaDE RPM' do
  source node['wade']['web']['rpm']['url']
  provider Chef::Provider::Package::Rpm
end
