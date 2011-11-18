include_recipe "asl::repo"
include_recipe "apache2"

if node[:asl][:modsec][:enable] == "yes"
	package "mod_security" do
		action :install
	end

	directory "/etc/httpd/modsecurity.d" do
		mode 0755
		owner "root"
		group "root"

		action :create
	end
end

if node[:asl][:version] == "full"
	include_recipe "asl::asl_full"
else
	include_recipe "asl::asl_lite"
end

template "/etc/asl/whitelist" do
	owner "root"
	group "root"
	mode 0644
	source "whitelist.erb"

	action :create
end

template "/etc/asl/config" do
	source "config.erb"
	mode 0600
	owner "root"
	group "root"
	
	action :create
	notifies :run, "execute[start-asl-scan]"
end

