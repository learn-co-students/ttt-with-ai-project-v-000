
module Players

  class Computer < Player

    def move(board)
      corner = ["1","3","7","9"].sample

      if !board.taken?(5)
        "5"

      elsif !board.taken?("#{corner}")
        "#{corner}"

      elsif board.cells[0] == self.token && board.cells[2] == self.token
        "2"

      elsif board.cells[0] == self.token && board.cells[6] == self.token
        "4"

      elsif board.cells[2] == self.token && board.cells[8] == self.token
        "6"

      elsif board.cells[6] == self.token && board.cells[8] == self.token
        "8"
      else
        [1,2,3,4,6,7,8,9].sample.to_s
      end
    end
  end
end
