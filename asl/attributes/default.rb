# ASL Configuration
# ASL Cookbook is not supported or endorsed by ASL.
# Cookbook stemmed from thread:
# http://atomicorp.com/forum/viewtopic.php?f=1&t=5507

set[:asl][:version] = "lite"

set[:asl][:username] = "USERNAME"
set[:asl][:password] = "PASSWORD"

set[:asl][:notify] = "no"
set[:asl][:notify_email] = "email@address.tld"

set[:asl][:use_web_db] = "no"

set[:asl][:psmon_enable] = "no"

set[:asl][:clamav][:enable] = "no"

set[:asl][:autoupdates] = "daily"

# If set to "yes" and Chef is creating a custom config for PHP, any changes ASL makes will be over written next chef-client run
set[:asl][:php][:checks] = "no"

set[:asl][:ssh][:rootlogin] = "yes"
set[:asl][:ssh][:pubkey] = "yes"

set[:asl][:rkhunter][:enable] = "no"

set[:asl][:ossec][:enable]= "no"

set[:asl][:modsec][:enable] = "yes"
# On our EC2 instance, this caused our server to experience very high load
set[:asl][:modsec][:antispam] = "no"

set[:asl][:modevasive][:enable] = "no"

set[:asl][:whitelist] = ["127.0.0.1"]

# If MySQL logging is enabled, please manually run ossec-mysql.sql located in the files directory to setup the initial ossec db
set[:asl][:ossec][:use_mysql] = "no"
set[:asl][:ossec][:mysql_server] = 'localhost'
set[:asl][:ossec][:mysql_user] = 'username'
set[:asl][:ossec][:mysql_pass] = 'password'
set[:asl][:ossec][:mysql_database] = 'ossec'

# Install the ASL Web Client?
set[:asl][:web_client] = false

arch = node[:kernel][:machine] == "i386" || node[:kernel][:machine] == "i686" ? "i386" : "x86_64"

default[:asl][:rpm_url] = "http://www.atomicorp.com/channels/atomic/#{node[:platform]}/#{node[:platform_version].split('.')[0]}/#{arch}/RPMS/atomic-release-1.0-13.el5.art.noarch.rpm"
default[:asl][:rpm_key_url] = "https://www.atomicorp.com/RPM-GPG-KEY.art.txt"

default[:asl][:channel] = "atomicorp.com/channels/asl-3.0/#{node[:platform]}"

default[:asl][:update_channel] = "2.0"
