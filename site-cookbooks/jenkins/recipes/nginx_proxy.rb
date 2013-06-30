include_recipe "nginx"

template "#{node.nginx.dir}/sites-available/proxy" do
  source "proxy.erb"
  mode 0700
  owner node.nginx.user
  group node.nginx.user
end

cookbook_file "#{node.nginx.dir}/htpasswd" do
  source "htpasswd"
  mode 0700
  owner node.nginx.user
  group node.nginx.user
end

nginx_site "proxy"

