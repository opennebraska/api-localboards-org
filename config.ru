# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run OrgOrg::Application

use Rack::Static,
	urls: ["/images","/js","/css"],
	root: "public"

run RackFile.new("public")