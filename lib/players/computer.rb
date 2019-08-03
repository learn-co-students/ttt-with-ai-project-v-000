module Players
  class Computer < Player
      WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6],]

    def move(board)
      #sleep(0.15)
      move = nil

     if !board.taken?(5)
       move = "5"
     elsif board.taken?(5) && board.turn_count == 1
       move = "1"
     else
       WIN_COMBINATIONS.detect do |win|
         if move != nil
           break
         elsif (board.position("#{win[0] + 1}") == board.position("#{win[1] + 1}")) && board.taken?("#{win[0] + 1}") && !board.taken?("#{win[2] + 1}")
           move = "#{win[2] + 1}"
        elsif (board.position(win[0] + 1) == board.position(win[2] + 1)) && board.taken?("#{win[0] + 1}") && !board.taken?("#{win[1] + 1}")
          move = "#{win[1] + 1}"
        elsif (board.position(win[1] + 1) == board.position(win[2] + 1)) && board.taken?("#{win[1] + 1}") && !board.taken?("#{win[0] + 1}")
             move = "#{win[0] + 1}"
         end
       end
          move = rand(1..9) if move == nil
      end
      move
    end
  end
end
