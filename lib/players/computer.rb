require 'pry'

module Players
  class Computer < Player
    def move(board)
move = nil
      puts "Please enter a number from 1..9"
      #binding.pry
      if board.taken?(1) == false
      move = "1"
      elsif board.turn_count == 1 && board.taken?(5) == false
        move = "5"
      elsif board.turn_count == 2 && board.taken?(3) == false
        move = "3"
      elsif board.turn_count == 2 && board.taken?(7) == false
       move = "7"
     elsif board.turn_count == 3 && board.position(1) ==  board.position(3) && board.taken?(2) == false
       move "2"
     elsif board.turn_count == 3 && board.position(1) == board.position(7) && board.taken?(4) == false
       move = "4"
     elsif board.turn_count == 4 && board.position(1) == board.position(6) && board.taken?(2) == false
       move = "2"
     elsif board.turn_count == 4 && board.position(1) == board.position(8) && board.taken?(6) == false
       move = "6"
     elsif board.turn_count == 5 && board.position(1) == board.position(6) && board.taken?(2) == false
       move = "2"
     elsif board.turn_count == 5 && board.position(1) == board.position(2) && board.taken?(3) == false
       move = "3"
end
end
end
end
