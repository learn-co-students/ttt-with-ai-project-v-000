require 'pry'

class Computer < Player

  # def move(board)
  #   binding.pry

  #   input = rand(0..9)
  #   if board.valid_move?(input)
  #     input.to_s
  #   end


  # end

  def move(board)
    #if turn_count is < 4
    if board.taken?("5") == false
        input = "5"
      elsif board.taken?("1") == false
        input = "1"
      elsif board.taken?("3") == false
        input = "3"
      elsif board.taken?("7") == false
        input = "7"
      elsif board.taken?("9") == false
        input = "9"
      else ["2", "4", "6", "8"].sample
        #else iterate through using win_combos
    end
  end

  #iterate through board and make an array of oppenets postions.  if 2 of 3 win combos exist, block

end