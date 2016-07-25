# require_relative "../player.rb"
module Players
  # class Human inherits from Player (root class)
  class Human < Player

    # asks the user for input and returns it
    def move(board)
      input = gets
      input
    end

  end
end
