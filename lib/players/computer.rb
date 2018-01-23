require 'pry'
module Players
  class Computer < Player

  #  def move(board)

  #    move = nil

  #    if !board.taken?(5)
  #      move = "5"
  #    elsif board.turn_count == 1
  #      "1"
  #    elsif board.turn_count == 3
  #      ["3", "7", "9"].sample
  #    else
  #      ["1", "2", "3", "4", "6", "7", "8", "9"].sample
  #    end
  #  end #move

    WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]
   ]

   def move(board)
     #sleep(0.15)
     move = nil

    if !board.taken?(5)
      move = "5"
    elsif board.taken?(5) && board.turn_count == 1
      move = ["1", "3", "7", "9"].sample
    else
      WIN_COMBINATIONS.detect do |win|
        if move != nil
          break
        elsif (board.position("#{win[0] + 1}") == board.position("#{win[1] + 1}")) && !board.taken?("#{win[2] + 1}")
          move = "#{win[2] + 1}"
          #binding.pry
        elsif (board.position(win[0] + 1) == board.position(win[2] + 1)) && !board.taken?("#{win[1] + 1}")
         move = "#{win[1] + 1}"
        elsif (board.position(win[1] + 1) == board.position(win[2] + 1)) && !board.taken?("#{win[0] + 1}")
            move = "#{win[0] + 1}"
          end
        end
         move = rand(1..9) if move == nil
       end
       move
    end

  end #class
end #module


#---------- if above code breaks, use the code below in the WIN_COMBINATIONS block ----------- #

      #elsif (board.position("#{win[0] + 1}") == board.position("#{win[1] + 1}")) && board.taken?("#{win[0] + 1}") && !board.taken?("#{win[2] + 1}")
      #    move = "#{win[2] + 1}"
      #elsif (board.position(win[0] + 1) == board.position(win[2] + 1)) && board.taken?("#{win[0] + 1}") && !board.taken?("#{win[1] + 1}")
      #    move = "#{win[1] + 1}"
      #elsif (board.position(win[1] + 1) == board.position(win[2] + 1)) && board.taken?("#{win[1] + 1}") && !board.taken?("#{win[0] + 1}")
      #    move = "#{win[0] + 1}"
