# Chef for Unit Test Session #

## Requirement ##
* AWS Account
* VirtualBox
* Vagrant
* chef
* knife-solo

## Setup ##
* Export AWS\_SECRET\_ACCESS\_KEY and AWS\_ACCESS\_KEY\_ID environment variables for EC2

* Install vagrant-aws and create dummy box
```
$ vagrant plugin install vagrant-aws
$ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box 
```

* Edit Vagrant file
```
$ vi Vagrant
```

* Create htpasswd for Jenkins Basic Auth
```
$ htpasswd -c site-cookbooks/jenkins/files/default/htpasswd {$user_name}
```

* Install gems and recipes
```
$ bundle install
$ berks install --path vendor/cookbooks
```

## Execute ##

* VirtualBox
```
$ vagrant up local
$ knife solo prepare local
$ knife solo cook local
```

* EC2
```
$ vagrant up remote --provider=aws
$ knife solo prepare remote
$ knife solo cook remote
```

## Verify ##

* VirtualBox
```
$ TARGET_HOST=local rake spec
```

* EC2
```
$ TARGET_HOST=remote rake spec
```

