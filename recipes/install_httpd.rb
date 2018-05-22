#
# Cookbook Name:: wade
# Recipe:: install_httpd
# Description:: Sets up Apache HTTPD service

cert_location = '/var/www/wade.cert'
key_location = '/var/www/wade.key'

httpd_service 'wade' do
  contact node['wade']['web']['contact']
  mpm 'prefork'
  action %i[create start]
end

%w[headers rewrite substitute php ssl].each do |m|
  httpd_module m do
    action :create
  end
end

postgres_pass = 'postgres'
databag_name = node['wade']['databag']['databag_name']
if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
elsif Chef::DataBag.list.key?(databag_name)
  if search(databag_name, 'id:passwords').any?
    passwords = data_bag_item(databag_name, 'passwords')
    postgres_pass = passwords['postgres_password']
  end
end

template '/etc/httpd-wade/conf.d/wade.environment.conf' do
  source 'wade.environment.conf.erb'
  variables(
    postgres_user: node['wade']['web']['postgres_user'],
    postgres_pass: postgres_pass,
    postgres_addr: node['wade']['web']['postgres_addr'],
    postgres_db: node['wade']['web']['postgres_db']
  )
  sensitive true
  notifies :restart, 'httpd_service[wade]', :delayed
end

remote_file cert_location do
  source node['wade']['web']['ssl']['cert']['location']
  owner 'apache'
  group 'apache'
  mode 0o600
  only_if { node['wade']['web']['ssl']['active'] == true }
end

remote_file key_location do
  source node['wade']['web']['ssl']['key']['location']
  owner 'apache'
  group 'apache'
  mode 0o600
  sensitive true
  only_if { node['wade']['web']['ssl']['active'] == true }
end

template '/etc/httpd-wade/conf.d/wade.common.conf' do
  source 'wade.common.conf.erb'
  notifies :restart, 'httpd_service[wade]', :delayed
end

httpd_config 'wade' do
  instance 'wade'
  source 'wade.apache.conf.erb'
  variables(
    ssl_active: node['wade']['web']['ssl']['active'],
    ssl_cert_location: cert_location,
    ssl_key_location: key_location
  )
  notifies :restart, 'httpd_service[wade]', :delayed
end
