module Players
  class Computer < Player
    include Players::InstanceMethod
    #https://www.ruby-forum.com/topic/113558
    #move method that accepts a board and returns the move
    #the computer wants to make in the form
    #of a 1-9 string
    #but it must be
    #capable of returning a
    #valid move at some point.
  end
end
