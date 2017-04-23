###############################################################################
# This recipe validates the json files present in a data_bag.
##
data_bag_path = node['delivery']['config']['delivery-bag']['data-bag-path'] 
Dir.chdir(data_bag_path)
databag_items = Dir.glob("*").select {|f| File.directory? f}

databag_items.each do |file|
  begin
    contents = File.open(file, 'rb').read
    bag = JSON.parse(contents)
  rescue JSON::ParserError
    raise "#{file} not valid JSON!"
  end
  if bag.fetch('id') != File.basename(file, '.json')
    fail "#{file} has mismatched 'id' attribute!"
  end
end


