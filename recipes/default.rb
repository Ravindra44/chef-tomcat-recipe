include_recipe "java"
tc7ver = node["tomcat7"]["version"]
tc7tarball = "apache-tomcat-#{tc7ver}.tar.gz"
tc7url = "http://archive.apache.org/dist/tomcat-7/v#{tc7ver}/bin/#{tc7tarball}"
tc7target = node["tomcat7"]["target"]
tc7user = node["tomcat7"]["user"]
tc7group = node["tomcat7"]["group"]

remote_file "/tmp/#{tc7tarball}" do
	source "#{tc7url}"
	node "0644"
		action :create
end

## create group
group "#{tc7group}" do
	comment "Tomcat7 user"
	gid "#{tc7group}"
	home "#{tc7target}"
	shell "/bin/false"
	system true
	action :create
end

## create base folder
directory "#{tc7target}/apache-tomcat-#{tc7ver}}" do
	owner "#{tc7user}"
	group "#{tc7group}"
	node "0755"
	action :create
end


	