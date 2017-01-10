require "restful_routing/version"
require 'listen'

module RestfulRouting
  base_path = Dir.pwd
  listening_to = base_path + '/config'

  listener = Listen.to(listening_to, only: /routes\.rb$/) do |modified, added, removed|
  	#run `rails routes` and put the output in a file called
  	#restful_routing.rb
  	File.open(base_path + '/restful_routing.rb', 'w') do |f|
  		f.write `rails routes`
  	end
  end
  listener.start # not blocking
end
