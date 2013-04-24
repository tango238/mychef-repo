#
# Cookbook Name:: cakephp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git node['cakephp']['home'] do
  repository "git://github.com/cakephp/cakephp.git" 
  reference "2.4"
  action :checkout
  user  "vagrant"
  group "vagrant"
end

directory node['cakephp']['home'] do
  owner "nginx"
  group "nginx"
  mode 0755
  recursive true
end
