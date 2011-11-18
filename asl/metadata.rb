maintainer       "Online Commerce Group, LLC"
maintainer_email "it@onlinecommercegroup.com"
description      "Installs and configures ASL, http://atomicorp.com"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

%w{ centos rehat }.each do |os|
  supports os
end

%w{ apache2 }.each do |cb|
  depends cb
end
