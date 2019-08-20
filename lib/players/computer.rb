module Players
  class Computer < Player

    def move(board)
      move=""

      if board.taken?(1) && board.cells[0] == board.cells[1] && !board.taken?(3)
        move=3.to_s
      elsif board.taken?(2) && board.cells[1] == board.cells[2] && !board.taken?(1)
        move=1.to_s
      elsif board.taken?(1) && board.cells[0] == board.cells[2] && !board.taken?(2)
        move=2.to_s

        #[3,4,5]
      elsif board.taken?(4) && board.cells[3] == board.cells[4] && !board.taken?(6)
        move=6.to_s
      elsif board.taken?(5) && board.cells[4] == board.cells[5] && !board.taken?(4)
        move=4.to_s
      elsif board.taken?(4) && board.cells[3] == board.cells[5] && !board.taken?(5)
        move=5.to_s

        #[6,7,8]
      elsif board.taken?(7) && board.cells[6] == board.cells[7] && !board.taken?(9)
        move=9.to_s
      elsif board.taken?(8) && board.cells[7] == board.cells[8] && !board.taken?(7)
        move=7.to_s
      elsif board.taken?(7) && board.cells[6] == board.cells[8] && !board.taken?(8)
        move=8.to_s

      #[0,3,6]
      elsif board.taken?(1) && board.cells[0] == board.cells[3] && !board.taken?(7)
        move=7.to_s
      elsif board.taken?(4) && board.cells[3] == board.cells[6] && !board.taken?(1)
        move=1.to_s
      elsif board.taken?(1) && board.cells[0] == board.cells[6] && !board.taken?(4)
        move=4.to_s

      #[1,4,7]
      elsif board.taken?(2) && board.cells[1] == board.cells[4] && !board.taken?(8)
        move=8.to_s
      elsif board.taken?(5) && board.cells[4] == board.cells[7] && !board.taken?(2)
        move=2.to_s
      elsif board.taken?(2) && board.cells[1] == board.cells[7] && !board.taken?(5)
        move=5.to_s

        #[2,5,8]
      elsif board.taken?(3) && board.cells[2] == board.cells[5] && !board.taken?(9)
        move=9.to_s
      elsif board.taken?(6) && board.cells[5] == board.cells[8] && !board.taken?(3)
        move=3.to_s
      elsif board.taken?(3) && board.cells[2] == board.cells[8] && !board.taken?(6)
        move=6.to_s

      #[0,4,8]
      elsif board.taken?(1) && board.cells[0] == board.cells[4] && !board.taken?(9)
        move=9.to_s
      elsif board.taken?(5) && board.cells[4] == board.cells[8] && !board.taken?(1)
        move=1.to_s
      elsif board.taken?(1) && board.cells[0] == board.cells[8] && !board.taken?(5)
        move=5.to_s

      #[6,4,2]
      elsif board.taken?(7) && board.cells[6] == board.cells[4] && !board.taken?(3)
        move=3.to_s
      elsif board.taken?(5) && board.cells[4] == board.cells[2] && !board.taken?(7)
        move=7.to_s
      elsif board.taken?(7) && board.cells[6] == board.cells[2] && !board.taken?(5)
        move=5.to_s

      else
        move=rand(1..9).to_s
      end
    end
  end
end
