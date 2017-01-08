require "restful_routing/version"

module RestfulRouting
  listener = Listen.to(Dir.pwd + '/config/routes.rb') do |modified, added, removed|
    puts "modified absolute path: #{modified}"
    puts "added absolute path: #{added}"
    puts "removed absolute path: #{removed}"
  end
  listener.start # not blocking
end
