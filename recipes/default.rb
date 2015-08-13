#
# Cookbook Name:: df_scala_ide
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


log "\n\nINITIATING SCALA IDE RUN FROM DOWNLOAD #{node['df_scala_ide']['source']}\n\n" do 
    level :info
end

template '/home/vagrant/README_SCALA_IDE.txt' do 
  source 'README_SCALA_IDE.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/chef_scala_ide_attribute_values.txt' do 
  source 'attribute_values.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/startScalaIde.sh' do 
  source 'startScalaIde.sh.erb'
  mode "0777"
  only_if { ::File.exists?('/home/vagrant') }
end

directory node['df_scala_ide']['local_dir'] do 
    mode "0755"
    recursive true
    action :create 
end



remote_file node['df_scala_ide']['remote_file'] do 
    source node['df_scala_ide']['source']
    mode "0755" 
    action :create_if_missing
end

execute "unzip_file" do 
    cwd node['df_scala_ide']['local_dir']
    command "tar -xzvf " + node['df_scala_ide']['tar_name']
    action :run
end


template '/tmp/scala_ide_attribute_values.txt' do
  source 'attribute_values.txt.erb'
  mode "0777"
end