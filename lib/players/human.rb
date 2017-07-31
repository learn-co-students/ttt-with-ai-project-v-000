module Players
  class Human < Player
    attr_accessor :board

    def move(board)
      "Please enter a number between 1 and 9"
      input = gets.chomp
    end

  end


end
