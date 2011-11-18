template "/etc/yum.repos.d/asl.repo" do
	owner "root"
	group "root"
	mode 0644
	source "asl.repo.erb"

	action :create
end

if node[:asl][:modevasive][:enable] == "yes"
	package "mod_evasive" do
		action :install
	end
end

if node[:asl][:psmon_enable] == "yes"
	package "psmon" do
		action :install
	end
end

if node[:asl][:ossec][:enabled] == "yes"
	package "ossec-hids-server" do
		action :install
	end
end

if node[:asl][:rkhunter][:enable] == "yes"
	package "rkhunter" do
		action :install
	end
end

if node[:asl][:clamav][:enable] == "yes"
	package "clamav" do
		action :install
	end
end

package "asl" do
  action :install
end

if node[:asl][:web_client] == true
	package "asl-web" do
	  action :install
	end
end

execute "start-asl-scan" do
	command "/var/asl/bin/asl -s -f"
	action :nothing
end
