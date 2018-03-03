require 'pry'

module Players
  class Computer < Player

    def move(board)
    #  binding.pry
        case board.turn_count
  #first move--------
  #if first player, bottom right corner
        when board.turn_count == 0
          !board.taken?(8)
          move = "8"

  #if second player, either bottom right, or top left
        when board.turn_count == 1
           move "8" unless board.taken?(8)
              move = "0"

  #second move ---------
  #if first player, top left corner, if taken, top right or bottom left
        when board.turn_count == 3
             !board.taken?(0)
              move = "0" or move = "2"

  # #if second player, bottom middle or right middle
        when board.turn_count == 4
               !board.taken(5)
                move = "5" or move = "7"
  #third move ----------

        # elsif board.move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil




            end
           end
        end
end
