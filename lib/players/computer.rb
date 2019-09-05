module Players
 class Computer < Player

   def initialize(token)
     super
   end

   def move(board)
     if !board.taken?(5)
       move = "5"
     elsif board.turn_count == 1
       move = [1, 3, 7, 9].shuffle.find {|m| !board.taken?(m)}.to_s
     elsif board.turn_count  <= 3
       move = [1, 3, 7, 9].shuffle.find {|m| !board.taken?(m)}.to_s
     else
       Game::WIN_COMBINATIONS.find do |win_combination|
         if win_combination.select{|index|board.position(index+1) == self.token}.size == 2 && win_combination.one?{|index| !board.taken?(index+1)}
           move = win_combination.select{|index| !board.taken?(index+1)}.first
           move += 1
           move.to_s
         elsif win_combination.select{|index| board.taken?(index+1) && board.position(index+1) != self.token}.count == 2 && win_combination.one?{|index| !board.taken?(index+1)}
           move = win_combination.select{|index| !board.taken?(index+1)}.first
           move += 1
           move.to_s
         end
       end
       move = [9, 7, 3, 1, 2, 4, 6, 8].find {|i| board.position(i) == " "} if move == nil
     end
     move
   end

 def other
   self.token.eql?("X") ? "O" : "X"
 end


 end
end