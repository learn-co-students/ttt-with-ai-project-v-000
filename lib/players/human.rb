module Players
  class Human < Player

    def initialize(token)
      super(token)
    end

    def move(board)
      puts "Please enter your move."
      input = gets.strip
      input
    end
  end
end