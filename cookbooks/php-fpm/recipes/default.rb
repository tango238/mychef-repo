#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family?("rhel")
  php_fpm_service_name = "php-fpm"
else
  php_fpm_service_name = "php5-fpm"
end

package php_fpm_service_name do
  action :upgrade
end

template node['php-fpm']['conf_file'] do
  source "php-fpm.conf.erb"
  mode 00644
  owner "root"
  group "root"
end

node['php-fpm']['pools'].each do |pool|
  fpm_pool pool do
    php_fpm_service_name php_fpm_service_name
  end
end

service "php-fpm" do
  service_name php_fpm_service_name
  supports :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :restart ]
end
