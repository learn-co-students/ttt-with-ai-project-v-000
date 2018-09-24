module Players
  class Human < Player

    def initialize(token = "X")
      @token = token
    end

    def move(board)
      puts "Please enter your move"
      gets.strip
    end

  end
end
