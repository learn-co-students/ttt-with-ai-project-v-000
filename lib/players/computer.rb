require 'pry'
module Players

  class Computer < Player

    def move(board)
      top_corner = ["1","3"].sample
      if top_corner == "1"
        other_top_corner == "3"
      elsif top_corner == "3"
        other_top_corner == "1"

      bottom_corner = ["7","9"].sample
      if bottom_corner == "7"
        other_bottom_corner == "9"
      elsif top_corner == "9"
        other_top_corner == "7"

      left_corner = ["1","7"].sample
      if left_corner == "1"
        other_left_corner == "7"
      elsif left_corner == "7"
        other_left_corner == "1"

      right_corner = ["3","9"].sample
      if right_corner == "3"
        other_right_corner == "9"
      elsif right_corner == "9"
        other_right_corner == "3"

      if !board.taken?(5)
        "5"

      elsif !board.taken?("#{top_corner}")
        "#{top_corner}"

      elsif board.taken?("#{top_corner}")
        "#{other_top_corner}"

      elsif board.cells[0] == self.token && board.cells[2] == self.token
        "2"


      elsif !board.taken?("#{left_corner}")
        "#{left_corner}"

      elsif board.taken?("#{left_corner}")
        "#{other_left_corner}"

      elsif board.cells[0] == self.token && board.cells[6] == self.token
        "4"



      elsif !board.taken?("#{right_corner}")
        "#{right_corner}"

      elsif board.taken?("#{right_corner}")
        "#{other_right_corner}"

      elsif board.cells[2] == self.token && board.cells[8] == self.token
        "6"

      elsif !board.taken?("#{bottom_corner}")
        "#{bottom_corner}"

      elsif board.taken?("#{bottom_corner}")
        "#{other_bottom_corner}"
        
      elsif board.cells[6] == self.token && board.cells[8] == self.token
        "8"
      else
        [1,2,3,4,6,7,8,9].sample.to_s
      end
    end
  end
end
