#
# Cookbook Name:: wade
# Recipe:: configure_php
# Description:: Configures the PHP on the server

%w[libxslt php-xml php-pgsql postgresql-libs].each do |p|
  package p do
    action :install
  end
end
