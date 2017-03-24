module Players

  class Computer < Player

    def move(board)
      move = nil
      take_center = 5
      take_corners = [1,3,7,9]
      #binding.pry
       #check if open, then best move is to take the center square (5)
      if !board.taken?(take_center)
        move = take_center
      else
        #if the center is taken, take one of the corner squares
        move = take_corners.shuffle.find { |move| !board.taken?(move) }
      end
      #center and corner squares are taken, choose a random empty square
        move ? move.to_s : rand(1..9).to_s
      end
  end
  
end
#strategy tips
# Go first if possible
# Take the center square
# After the center square, the corners are the best moves
