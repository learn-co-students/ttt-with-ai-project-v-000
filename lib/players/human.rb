module Players
  class Human < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(board)
      puts "Please select your square: 1- 9"
      gets.chomp
    end
  end
end
