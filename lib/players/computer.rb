module Players
class Computer < Player

  def move(board, game=Game.new)
    my_answer = ("1".."9").to_a.sample
      until board.valid_move?(my_answer)
    end
  end 
#    CORNERS = ["1", "3", "7", "9"]

#    if board.turn_count == 0
#      return CORNERS.sample
#    end

    #Final
  #  (board.random_available_index+1).to_s



end #ends class
end #ends module
