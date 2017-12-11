module Players
  class Computer < Player

    def move(board)
     move = nil
     #When going first, if the middle spot is empty, take it.
     if !board.taken?(5)
       move = "5"
     # If going second and the middle spot is taken, take the upper left corner
     elsif board.turn_count == 1
       move = "1"
     #if we did take the middle spot, take a corner
     elsif board.turn_count == 2
       move = [1, 3, 7, 9].detect{ |i| !board.taken?(i)}.to_s
     elsif board.turn_count == 3 && (board.position(1) == board.position(9)  || board.position(3) == board.position(7))
       #checking to see if corners match
       move = "2"
     else
       Game::WIN_COMBINATIONS.detect do |combo|
         #Check if we can win
         if combo.select{ |i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "} #<-- checking to see if space is empty
           move = combo.select{ |i| !board.taken?(i+1)}.first.to_i.+(1).to_s
         elsif combo.select{ |i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{ |i| board.position(i+1) == " "}
           move = combo.select{ |i| !board.taken?(i+1)}.first.to_i.+(1).to_s
         end
       end

       move = [1, 2, 7, 9, 2, 4, 6, 8].detect{ |i| !board.taken?(i)}.to_s if move == nil
     end

     move
   end
 end
end


# def move(board)
#   rand(1..9).to_s
#   # computer plays - but as it's not given any logic - it's total crap.
# end
