#
# Cookbook Name:: cakephp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/vagrant/cakephp" do
  repository "git://github.com/cakephp/cakephp.git" 
  reference "2.4"
  action :checkout
  user  "nginx"
  group "nginx"
end
