# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Promgmt::Application.initialize!

#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.server_settings = {
#:address => "172.16.104.110",
#:port => 25,
#
##:authentication => :login,
#:user_name => "myname@domain.com",
#:password => "123"
#
#}
