#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
yum_key "RPM-GPG-KEY-jenkins" do
  url "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
  action :add
end

remote_file "/etc/yum.repos.d/jenkins.repo" do
  source "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
  mode 0644
  action :create_if_missing
end

yum_package "jenkins" do
  action :install
end

service "jenkins" do
  action [:start]
end

include_recipe "jenkins::nginx_proxy"
