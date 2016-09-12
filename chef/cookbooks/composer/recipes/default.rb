#
# Cookbook Name:: composer
# Recipe:: default
#

execute "composer install" do
  command <<-EOS
    curl -sS #{node['composer']['url']} | php -- --install-dir=#{node['composer']['install_dir']}
    rm -r #{node['composer']['bin']}
    ln -s #{node['composer']['install_dir']}composer.phar #{node['composer']['bin']}
  EOS
end