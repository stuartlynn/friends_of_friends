require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('friends_of_friends', '0.1.0') do |p|  
  p.description     = "gem for clusting using fof algorithm "  
  p.url             = "http://github.com/stuarlynn/friends_of_friends"  
  p.author          = "Stuart Lynn"  
  p.email           = "stuart@zooniverse.org"  
  p.ignore_pattern  = ["tmp/*", "script/*"]  
  p.development_dependencies = []  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }