module Players
  class Computer < Player
    attr_accessor :move

    def move(board)
      if board.turn_count == 0
        "1"
      elsif board.turn_count == 1 && !board.taken?(5)
        "5"
      elsif (board.turn_count == 3 && self.token == board.cells[4]) && ((board.cells[0] != " " && board.cells[8] != " ") || (board.cells[2] != " " && board.cells[6] != " "))
        if board.cells[1] == " "
          "2"
        else
          "4"
        end
      elsif board.turn_count >= 1
       x = close(board)
       if board.valid_move?(x) == true
         close(board)
       else
         valid(board)
       end
      end
    end


    def close(board)
     Game::WIN_COMBINATIONS.each do |combo|
       #binding.pry
       if board.cells[combo[0]] == self.token || board.cells[combo[1]] == self.token
         if board.cells[combo[0]] == board.cells[combo[1]]
            @move = combo[2] unless board.taken?(combo[2]+1)
            break if @move == combo[2]
         elsif board.cells[combo[1]] == board.cells[combo[2]]
            @move = combo[0] unless board.taken?(combo[0]+1)
            break if @move == combo[2]
         elsif board.cells[combo[2]] == board.cells[combo[0]]
            @move = combo[1] unless board.taken?(combo[1]+1)
            break if @move == combo[2]
         end
       elsif board.cells[combo[0]] != " " || board.cells[combo[1]] != " "
         if board.cells[combo[0]] == board.cells[combo[1]]
           @move = combo[2] unless board.taken?(combo[2]+1)
         elsif board.cells[combo[1]] == board.cells[combo[2]]
           @move = combo[0] unless board.taken?(combo[0]+1)
         elsif board.cells[combo[2]] == board.cells[combo[0]]
           @move = combo[1] unless board.taken?(combo[1]+1)
         end
       end
     end
     move_index = @move.to_i + 1
     move_index.to_s
   end

   def valid(board)
     moves = ["1", "9", "3", "7", "5", "6", "4", "2", "8"]
     moves.detect do |move|
     board.valid_move?(move) == true
    end
   end  
  end
end
