# Domain config site của các bạn
DOMAIN = 'vagrant-chef-laravel.dev'

Vagrant.configure("2") do |config|

 # Config OS, ở đây mình dùng Centos version 6.5
 # Các bạn có thể sử dụng bất kỳ OS nào phù hợp
 config.vm.box = "centos65-vagrant-chef-laravel"
 config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

 # Config IP private network cho máy ảo, đây là IP sử dụng để từ máy local
 # truy cập vào máy ảo
 # Các bạn có thể đổi số tùy "sở thích" hoặc trách trùng các con máy ảo khác
 # Trong trường hợp khi chạy vagrant up bị lỗi network thì làm theo như sau:
 # vagrant ssh
 # sudo rm -rf /etc/udev/rules.d/70-persistent-net.rules
 # exit
 # vagrant reload --provision
 config.vm.network "private_network", ip: "192.168.33.101"

 # Đoạn này config synced folder, nó sẽ map folder project của bạn vào
 # đường dẫn /var/www/{domain bạn cung cấp phía trên}
 config.vm.synced_folder "./", "/var/www/#{DOMAIN}"

 # Install chef
 # Ở đây mình dùng plugin omnibus để kiểm soát version của chef
 config.omnibus.chef_version = "12.10.24"

 # provisioning with chef solo.
 # phần chính đây rồi CHEF....
 config.vm.provision :chef_solo do |chef|
   chef.cookbooks_path = "./chef/cookbooks"
   chef.data_bags_path = "./chef/data_bags"
   chef.add_recipe "ntp"
   chef.add_recipe "remi"
   chef.add_recipe "httpd"
   chef.add_recipe "php"
   chef.add_recipe "composer"
   chef.add_recipe "laravel"
 end

end