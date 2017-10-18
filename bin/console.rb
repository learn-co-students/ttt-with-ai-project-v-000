require_relative '../config/environment'
require 'irb'


# this is called a helper method
# ...it is used so you don't have to constantly load & reload the console
def reload!
  load './config/environment.rb'
end

IRB.start
