require 'pry'
module Players
  class Computer < Player


    def move(board)
      #select 5 unless it is taken
      #if turn count = 1 and 1 is not taken, choose 1
      #check corners and choose them if not taken
      #check other squares after corners
      ####want to build out more functionality for combo lengths = 2 need help with this.
      if (!board.taken?(5))
        move = '5'
      elsif (board.turn_count == 1 && !board.taken?(1))
        move = '1'
      elsif (board.turn_count == 2)
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      elsif (board.turn_count == 3)
        move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
      else
        move = Random.rand(1..9).to_s

      end
    end
  end
end
