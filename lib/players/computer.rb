module Players
  class Computer < Player
    def move(board)
      all=[*1..9].join(" ").split
      corners=["1","3","7","9"]
      sub_corners1=["3","7"]
      sub_corners2=["1","9"]
      if board.turn_count == 0
        all[4]
      elsif board.turn_count == 1
        board.taken?("5") == false ? all[4] : corners.sample
      elsif board.turn_count == 2
        if board.taken?("1") || board.taken?("9")
          sub_corners1.sample
        elsif board.taken?("3") || board.taken?("7")
          sub_corners2.sample
        elsif corners.sample
        end
      elsif board.turn_count == 3
        if board.cells[4] == board.cells[0]
          all[8]
        elsif board.cells[4] == board.cells[8]
          all[0]
        elsif board.cells[4] == board.cells[2]
          all[6]
        elsif board.cells[4] == board.cells[6]
          all[2]
        end
      else
        all.sample
      end
    end
  end
end
