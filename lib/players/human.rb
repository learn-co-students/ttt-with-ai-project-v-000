require 'pry'
module Players
  class Human < Player
    include Players::InstanceMethod
    #https://www.ruby-forum.com/topic/113558
    #binding.pry
  end
end
