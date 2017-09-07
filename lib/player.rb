class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

module Players
  class Human < Player
    def move(board)
      puts "Place your token somewhere #{self.token}."
      input = gets.strip
      # board.display
    end
  end

  class Computer < Player
    def move(board)
      
    end

    def go_for_corners
      [1,3,7,9].sample.to_s
    end
  end





end
