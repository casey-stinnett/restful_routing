require "restful_routing/version"
require 'listen'
require 'open3'

module RestfulRouting
  base_path = Dir.pwd
  listening_to = base_path + '/config'

  listener = Listen.to(listening_to, only: /routes\.rb$/) do |modified, added, removed|
  	#run `rails routes` and put the output in a file called
  	#restful_routing.rb
  	funny_messages = [
      "Oh, dear. Naughty, naughty! Rails knows what you typed \nand she doesn't like it...\n\n",
      "Whoops! Ya done something ya should'na. Your routes need fixin'.\n\n", 
      "Not that you're a cotton-headed-ninny-muggins, \nbut you gotta fix something to get those routes.\n\n",
      "Ummm...your routes shouldn't look like that.\n\n",
      "Why you gotta be like that, man? Now you've gone an' offended Rails\nwith what you typed.\n\n",
      "Dag, yo. Your routes have seen better days.\n\n"
    ]

    File.open('restful_routing.rb', 'w+') do |f|
      # stdout, stderr, status, thread = Open3.capture3("rails routes")
      stdin, stdout, stderr, thread = Open3.popen3('rails routes')

      if thread.value.success?
        f.write stdout.read
      else
        f.write funny_messages.sample # choose a random funny message

        full_error = stderr.read
        error_array = full_error.split "\n"

        error_array[0...-4].each do |error|
          # Don't get the lines like '/User/username/...'
          if error[0] == '/' 
            # unless they have to do with what in the config folder
            if error.index '/config' 
              f.write error + "\n"
            end
          else
            f.write error + "\n"
          end
        end #end error_array.each
      end #end if else

      f.write "\nRun `rails routes` in the terminal if you want the full error."
    end #end File.open
  end
  listener.start # not blocking
end
