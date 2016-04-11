class Player
  class Human < Player

    def move(board)
      loop do
        puts "Please enter your move (1-9):"
        input = gets.strip
        if board.valid_move?(input)
          board.update(input, self)
          break
        else
          puts "Invalid move."
        end
      end
    end
    
  end
end