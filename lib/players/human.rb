module Players
  class Human < Player

    def initialize(name)
      super
      @name = name
    end 

    def move(board)
      puts "Please enter a move 1-9"
      move = gets.strip
      return move
    end

  end
end
