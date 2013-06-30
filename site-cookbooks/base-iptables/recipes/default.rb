#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
service "iptables"

template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  owner "root"
  group "root"
  mode "0600"

  notifies :restart, "service[iptables]"
end
