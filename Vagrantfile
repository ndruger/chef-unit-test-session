# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :local do |local|
    local.vm.box = "centos"
    local.vm.network :private_network, ip: "192.168.50.12"
    local.vm.provision :chef_solo do |chef|
      chef.json = {
        "rvm" => {
          "vagrant" => {
            "system_chef_client" => "/opt/chef/bin/chef-client",
            "system_solo_client" => "/opt/chef/bin/chef-solo"
          }
        }
      }
    end
  end

  config.vm.define :remote do |remote|
    remote.vm.box = "dummy"
    remote.vm.provider :aws do |aws, override|
      aws.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
      aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      aws.keypair_name = "aws_test"
      aws.instance_type = "t1.micro"
      aws.region = "ap-northeast-1"
      aws.ami = "ami-f9af3af8"	# not name
      aws.security_groups = [ 'test' ]
      aws.tags = {
        'Name' => 'jenkins-test'
      }
      override.ssh.username = "ec2-user"
      override.ssh.private_key_path = "~/.ssh/aws_test.pem"

      # https://github.com/mitchellh/vagrant-aws/pull/26
      aws.user_data = <<-USER_DATA
#!/bin/sh
sed -i -e 's/^\\(Defaults.*requiretty\\)/#\\1/' /etc/sudoers
      USER_DATA
    end
  end
end
