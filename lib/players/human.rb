require 'pry'
module Players

  class Human < Player

    def move(board)
      board.display
      puts "Enter a number between 1-9:"
      input = gets.strip
      if board == []
        board = Board.new
      end
      # binding.pry
      if board.valid_move?(input)
        return input
      else
        puts "Invalid move!"
        move(board)
      end
    end

  end

end
