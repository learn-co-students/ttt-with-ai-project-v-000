module Players
  class Human < Player
    attr_accessor :board
    def move(board)
      puts "please enter 1-9 for your move"
      gets.strip
    end
  end
end
