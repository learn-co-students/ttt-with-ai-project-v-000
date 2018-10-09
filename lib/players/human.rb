module Players
  class Human < Player

    def initialize(position)
      @token = position
    end

    def move(board)

      puts "Which cell would you like to pick (1-9)?"
      position = gets

    end

  end

end
