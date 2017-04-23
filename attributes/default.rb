# Path where data bags and chef config file are stored
default['delivery']['config']['delivery-bag']['data-bag-repo-path'] 				= "/home/ubuntu/test-repo/data_bags"
default['delivery']['config']['delivery-bag']['json-path'] 							= "/home/ubuntu/test-repo/data_bags/test-bag/test.json"
default['delivery']['config']['delivery-bag']['data-bag-path'] 						= "/home/ubuntu/test-repo/data_bags/test-bag"
default['delivery']['config']['delivery-bag']['data-bag-name'] 						= "test-bag"
default['delivery']['config']['knife_rb'] 											= "/etc/chef/knife.rb"
default['delivery']['config']['git-repo-path']										= "/home/ubuntu/test-repo"
default['delivery']['config']['git-repo-uri']										= "git@github.com:gitsite/deployment.git"

