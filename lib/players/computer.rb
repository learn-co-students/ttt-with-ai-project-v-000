module  Players

  class Computer < Player

    def move(board)



    end



  end

end

################## AI PLAY LOGIC ##################

# Using if/else/elsif statements:

##### AI's FIRST MOVE ##### turn_count == 1
# 1) if AI plays first, then move to center cell (4)
# 2) elsif AI plays second, and the center cell is taken, then move to upper-left corner cell (0)
# 3) elsif AI plays second, and the center cell is not taken, then move to center cell

##### AI's SECOND MOVE ##### turn_count == 2
# 4) elsif AI plays third, 


##### AI's THIRD MOVE ##### turn_count == 3
