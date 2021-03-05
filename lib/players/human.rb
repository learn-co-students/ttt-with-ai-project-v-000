# Define a Human class that inherits from Player(player.rb)
# This class should be namespaced in the module Players because the human.rb file is inside the player/directory

# The human player must implement a #move method that takes in a board argument and allows a human player to enter a move via the CLI. The method should return the value the user enters.. Eveb though the method accepts a board argument, it does not need to use it.

module Players
  class Human < Player
  def move(board)
      input = gets.strip
    end
  end
end  


  
  