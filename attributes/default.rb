#deconstructing the download from it's component parts
#http://docs.datafundamentals.com/lib/scala-SDK-4.1.1-vfinal-2.11-linux.gtk.x86_64.tar.gz
default['df_scala_ide']['version'] = "4.1.1-vfinal-2.11-linux.gtk.x86_64"
default['df_scala_ide']['web_lib_source'] = "http://docs.datafundamentals.com/lib/"
default['df_scala_ide']['name'] = "scala-SDK-" + node['df_scala_ide']['version']
default['df_scala_ide']['tar_name'] = node['df_scala_ide']['name'] + ".tar.gz"
default['df_scala_ide']['source'] = node['df_scala_ide']['web_lib_source'] + node['df_scala_ide']['tar_name']  
default['df_scala_ide']['local_dir'] = "/usr/local/eclipse/"
default['df_scala_ide']['remote_file'] = node['df_scala_ide']['local_dir']  + node['df_scala_ide']['tar_name']   

