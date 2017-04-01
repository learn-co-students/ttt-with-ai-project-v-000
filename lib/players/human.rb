module Players
  class Human < Player
    attr_accessor

    def initialize(token)
      @token = token
    end

    def move(board)
      puts "Please enter a number between 1 and 9 to begin."
      gets.chomp.tap{|a|}
    end
  end
end
