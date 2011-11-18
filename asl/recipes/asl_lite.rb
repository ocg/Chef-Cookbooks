package "asl-lite" do
	action :install
end

# Run update after config setup
execute "start-asl-scan" do
	command "/var/asl/bin/asl-lite -u"
	action :nothing
end
