module Players
  class Human < Player
    attr_reader :name

    def initialize(token)
      super
      @name = name
    end

    def move(board)
      puts "Enter a number 1 - 9"
      input = gets.strip
    end
  end

end
