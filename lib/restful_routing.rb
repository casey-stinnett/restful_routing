require "restful_routing/version"
require 'listen'

module RestfulRouting
  base_path = Rails.root.to_s
  listener = Listen.to(base_path + '/config/', only: /routes\.rb$/) do |modified, added, removed|
  	#run `rake routes` and put the output in a file called
  	#restful_routing.rb
  	cmd = "rake routes > #{base_path}/restful_routing.rb" 
  	`#{cmd}`
  end
  listener.start # not blocking
end
