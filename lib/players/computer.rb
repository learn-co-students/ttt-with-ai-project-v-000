require 'pry'
module Players
  class Computer < Player

    def move(board)
      move = nil
#
       Game::WIN_COMBINATIONS.detect do |array|
         #binding.pry
         if board.cells[array[0]] == board.cells[array[1]] && board.cells[array[2]] == " " && board.cells[array[0]] != " "
           move = array[2]
         elsif board.cells[array[1]] == board.cells[array[2]] && board.cells[array[0]] == " " && board.cells[array[1]] != " "
           move = array[0]
         elsif board.cells[array[0]] == board.cells[array[2]] && board.cells[array[1]] == " " && board.cells[array[0]] != " "
           move = array[1]

end #end of if
end #end of iteration


        if board.valid_move?(5)
          move =  "5"
        else
          move = [1,2,4,5,6,7,8,9,3].detect { |x| board.valid_move?(x) }


end



    end #end of Move
  end #end of class Computer < Player
end #end of Module Players
