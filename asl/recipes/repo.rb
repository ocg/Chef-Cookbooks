# Installs the ASL repository for full asl install

remote_file "#{Chef::Config[:file_cache_path]}/atomic.rpm" do
	source node[:asl][:rpm_url]
	owner "root"
	group "root"
	mode "0644"

	not_if do File.exists?('/etc/yum.repos.d/atomic.repo') end
end

execute "install_atomic_key" do
	command "rpm --import #{Chef::Config[:file_cache_path]}/atomic-gpg.txt"
	action :nothing
end

remote_file "#{Chef::Config[:file_cache_path]}/atomic-gpg.txt" do
	source node[:asl][:rpm_key_url]
	owner "root"
	group "root"
	mode "0644"
	notifies :run, "execute[install_atomic_key]", :immediately

	not_if do File.exists?('/etc/yum.repos.d/atomic.repo') end
end

execute "install_atomic_repo" do
	command "rpm -i #{Chef::Config[:file_cache_path]}/atomic.rpm"
	action :run

	not_if do File.exists?('/etc/yum.repos.d/atomic.repo') end
end
