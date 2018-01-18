require 'pry'
module Players

  class Human < Player
    
    def move(board)
      #retrieves input from human player
      puts "Enter a number between 1-9:"
      input = gets.strip
      #checks for valid board and creates on if not
      if board == []
        board = Board.new
      end
      # binding.pry
      #checks input is valid and returns if it is, runs move again if it is not
      if board.valid_move?(input)
        return input
      else
        puts "Invalid move!"
        move(board)
      end
    end

  end

end
