require_relative '../player.rb'

class Computer < Player
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def opponent
    if token=="X"
      @opponent="O"
    else
      @opponent="X"
    end
  end

  def move(board)


    WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
         position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
         position_3 = board.cells[win_index_3] # load the value of the board at win_index_3

         if (position_1 == opponent && position_2 == opponent)
           position = (win_index_3+1).to_s
           if !board.taken?(position)
             return position
           end
         elsif (position_1 == opponent && position_3 == opponent)
           position = (win_index_2+1).to_s
           if !board.taken?(position)
             return position
           end
         elsif (position_2 == opponent && position_3 == opponent)
           position = (win_index_1+1).to_s
           if !board.taken?(position)
             return position
           end
         end
     end


    return rand(1..9).to_s
  end

end
