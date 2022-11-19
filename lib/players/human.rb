require_relative "../player.rb"

module Players
  class Human < Player
    #Calling the method asks for a user input and returns the user input
    def move(board)
      print "Please enter your desired move position: "
      input = gets.strip
      input
    end
  end
end
