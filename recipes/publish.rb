# *** <notes> ***
# This recipe assumes that the directories representing each data bag are at the
# root of the repository. Each data bag item should be a .json file within the directory
# *** </notes> ***

# Get list of data bags
data_bag_path = node['delivery']['config']['delivery-bag']['data-bag-repo-path']
Dir.chdir(data_bag_path)
data_bag_list = Dir.glob("*").select {|f| File.directory? f}

# For each data bag in the repository test creating the data bag and items within
data_bag_list.each do |databag|
  execute 'Create Data Bag on Chef Server' do
    command "knife data bag create --config #{node['delivery']['config']['knife_rb']} #{node['delivery']['config']['delivery-bag']['data-bag-name']}"
    action :run
  end

  # Get list of data bag items
  data_bag_item_list = Dir.glob("#{node['delivery']['config']['delivery-bag']['data-bag-path']}/*.json")

  data_bag_item_list.each do |item|
    execute 'Upload Data Bag Item to Chef Server' do
      command "knife data bag from file --config #{node['delivery']['config']['knife_rb']}  #{node['delivery']['config']['delivery-bag']['data-bag-name']} #{node['delivery']['config']['delivery-bag']['json-path']}"
      action :run
    end
  end
end

git node['delivery']['config']['git-repo-path'] do
   repository node['delivery']['config']['git-repo-uri']	
   revision 'master'
   action :sync
end
