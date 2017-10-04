module Players
  class Human < Player

    attr_accessor :game, :board, :player, :token

    def initialize(token = nil)
      @token = token
    end

    def move(cells)
      puts "Type where you would like to move ('1-9')"
      input = gets.strip
      input
    end

  end
end
