module Players
  class Human < Player
    attr_reader :name

    def initialize(token)
      super
      @name = "Human"
    end

    def move(board)
      puts "Please enter a number: 1 through 9"
      gets.strip
    end

  end
end
