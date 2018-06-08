require 'pry'
module Players
  class Computer < Player
    # def display
    #   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    #   puts "-----------"
    #   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    #   puts "-----------"
    #   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    # end
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]

    def move(board)
      move_arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # binding.pry
      move_arr.sample
    end

   end
end
