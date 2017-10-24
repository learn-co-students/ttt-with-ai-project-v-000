module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)
      puts "Please make a move:"
      puts "#{board}"
      gets.strip
    end
  end

end
