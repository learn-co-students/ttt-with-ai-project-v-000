module Players
  
  class Human < Player
  attr_accessor :board, :game
  attr_reader :token
    
    def move(board)
      puts"Make your move friendo. Choose 1-9"
      gets.chomp
    end

  end

end

