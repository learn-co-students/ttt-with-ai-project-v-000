class Player
  attr_reader :token
  def initialize(token)
  @token = token
  end
end

module Players
  class Human < Player
    def move(board)
      input = gets.strip
      board[input.to_i-1] = self.token
      return input
    end

    def move_play(board)
      puts "Please enter 1-9:"
      input = gets.strip
      if board.valid_move?(input)
      board.cells[input.to_i-1] = self.token
      return input
    else move_play(board)
      end
    end
  end

  class Computer < Player
    def move(board)
      n=5
      while !board.valid_move?(n)
        n=n-1
      end
      return "#{n}"
    end

    
  end



end
