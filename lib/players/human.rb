module Players
  
  class Human < Player
  attr_accessor :board, :game
  attr_reader :token
    
    def move(board)
      gets.strip
    end

  end

end

