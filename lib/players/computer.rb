module Players
  class Computer < Player
    @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    WIN_COMBINATIONS = [
       [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]
     ]

      def move(board)
        combo2 = WIN_COMBINATIONS.detect do |combo|
          board.cells[combo[0]] == board.cells[combo[1]] && board.taken?(combo[0]) ||
          board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[1]) ||
          board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0])
        end
        if combo2 != nil
          blocker = combo2.map {|index| board.cells[index]}
          index = blocker.find_index(" ")
           if index != nil
            index2 = combo2[blocker.find_index(" ")]
            index2 +=1
           end
        else
          @@valid_moves.sample
        end
      end
    end

end
