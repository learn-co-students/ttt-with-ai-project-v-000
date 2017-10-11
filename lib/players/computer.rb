module Players
  class Computer < Player

    def move(board)
      if !board.taken?('5')
        '5'
      elsif
        win(board) + 1
      end
    end

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
   ]

    def win(board)
      WIN_COMBINATIONS.each do |combo|
        position_1 = board.cells[combo[0]]
        position_2 = board.cells[combo[1]]
        position_3 = board.cells[combo[2]]

        xo= self.token

      if (position_1 == " " && position_2 == "#{xo}" && position_3 == "#{xo}")
        return combo[0] + 1
      elsif (position_1 == "#{xo} " && position_2 == " " && position_3 == "#{xo}")
        return combo[1] + 1
      elsif (position_1 == "#{xo} " && position_2 == "#{xo}" && position_3 == " ")
        return combo[2] + 1
      elsif
        false
      end
    end

  end
end
end
