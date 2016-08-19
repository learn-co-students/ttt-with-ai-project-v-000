require 'pry'
module Players
 class Computer < Player

   attr_accessor :my_move

   WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
   ]
   def move(board)
#     binding.pry
     case board.turn_count
     when 0..2
       free = board.cells.size.times.select { |i| board.cells[i] == " " }
       free_corners = free.select { |e| e == 0 || e == 2 || e == 6 || e == 8 }
       free_corners.sample.+(1).to_s
     when 3..8
       #go through the win combinations
       WIN_COMBINATIONS.each do |win|
         #and find the ones that have 2 of my tokens in them and that are on the board and a blank space and return the blank space as my move
        my_moves = board.cells.size.times.select { |i| board.cells[i] == token }
        opp_moves = board.cells.size.times.select { |i| board.cells[i] != token && board.cells[i] != " " }
        opp_wins = win - opp_moves - my_moves
        leftover = win - my_moves - opp_moves

        if leftover.size == 1
          self.my_move = leftover.first.+(1).to_s
        elsif opp_wins.size == 1
          self.my_move = opp_wins.first.+(1).to_s
        else
          self.my_move = [1, 3, 7, 9, 2, 4, 6, 8].detect { |i| !board.taken?(i) }.to_s
        end
      end
        my_move

    #   when 8
    #     last_free = board.cells.size.times.select {|i| board.cells[i] == " "}
    #     last_free.+(1).to_s
      end
   end
 end
end
