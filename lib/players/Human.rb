class Players
  class Human < Player
     def move(board)
       gets.chomp
     end
  end
  class Computer < Player
    def strategy
      available_moves = []
      pos_taken = []
      board.cells.each.with_index do |val,index|
              if val != "O" || val != "X"
                available_moves << index
              end #checks which spots are available
              if val == self.token
                  pos_taken << index
              end #indexes where the computer's token occupies
           end
        board.WIN_COMBINATIONS.detect.with_index do |x,i|
             x[0] == self.token && self.token == x[1] && available_moves.include?(i)
             #i want to use the WIN_COMBINATIONS array to detect our next best move to win.
             #checking if the token is occupying two out of three winning spots, and hopefully returning the move 
        end
      end
     def move(board)
        if board.turn_count <= 5
          Rand.rand(1..10)
          #make the first few moves random then strategize the remaining moves
        else
           strategy #this method is in progress
        end
  end

end
