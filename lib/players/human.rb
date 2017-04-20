module Players
  class Human < Player

    def initialize(token)
      super(token)
    end

    def move(board)
      puts "Please enter your move (1-9)."
      input = gets.strip
      input
    end
  end
end