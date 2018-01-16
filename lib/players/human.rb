module Players
  class Human < Player
    attr_accessor :type

    def type
      @type = "Human"
    end

    def move(board)
      puts "Please enter 1-9:"
      index = gets.strip
    end
  end
end
