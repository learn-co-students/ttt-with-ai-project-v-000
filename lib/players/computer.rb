
module Players
  class Computer < Player
    def move(board)

      computer_move = 0

      a = board.cells.values_at(0,1,2)
      b = board.cells.values_at(3,4,5)
      c = board.cells.values_at(6,7,8)
      d = board.cells.values_at(0,3,6)
      e = board.cells.values_at(1,4,7)
      f = board.cells.values_at(2,5,8)
      g = board.cells.values_at(0,4,8)
      h = board.cells.values_at(6,4,2)

      if a == [" "," "," "] || a == ["#{self.token}"," "," "] || a == [" ","#{self.token}"," "] || a == [" "," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 1 if board.cells[1] == " "
        computer_move = 2 if board.cells[2] == " "

      elsif a == ["#{self.token}","#{self.token}"," "] || a == [" ","#{self.token}","#{self.token}"] || a == ["#{self.token}"," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 1 if board.cells[1] == " "
        computer_move = 2 if board.cells[2] == " "

      elsif b == [" "," "," "] || b == ["#{self.token}"," "," "] || b == [" ","#{self.token}"," "] || b == [" "," ","#{self.token}"]
        computer_move = 3 if board.cells[3] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 5 if board.cells[5] == " "

      elsif b == ["#{self.token}","#{self.token}"," "] || b == [" ","#{self.token}","#{self.token}"] || b == ["#{self.token}"," ","#{self.token}"]
        computer_move = 3 if board.cells[3] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 5 if board.cells[5] == " "

      elsif c == [" "," "," "] || c == ["#{self.token}"," "," "] || c == [" ","#{self.token}"," "] || c == [" "," ","#{self.token}"]
        computer_move = 6 if board.cells[6] == " "
        computer_move = 7 if board.cells[7] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif c == ["#{self.token}","#{self.token}"," "] || c == [" ","#{self.token}","#{self.token}"] || c == ["#{self.token}"," ","#{self.token}"]
        computer_move = 6 if board.cells[6] == " "
        computer_move = 7 if board.cells[7] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif d == [" "," "," "] || d == ["#{self.token}"," "," "] || d == [" ","#{self.token}"," "] || d == [" "," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 3 if board.cells[3] == " "
        computer_move = 6 if board.cells[6] == " "

      elsif d == ["#{self.token}","#{self.token}"," "] || d == [" ","#{self.token}","#{self.token}"] || d == ["#{self.token}"," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 3 if board.cells[3] == " "
        computer_move = 6 if board.cells[6] == " "

      elsif e == [" "," "," "] || e == ["#{self.token}"," "," "] || e == [" ","#{self.token}"," "] || e == [" "," ","#{self.token}"]
        computer_move = 1 if board.cells[1] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 7 if board.cells[7] == " "

      elsif e == ["#{self.token}","#{self.token}"," "] || e == [" ","#{self.token}","#{self.token}"] || e == ["#{self.token}"," ","#{self.token}"]
        computer_move = 1 if board.cells[1] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 7 if board.cells[7] == " "

      elsif f == [" "," "," "] ||f == ["#{self.token}"," "," "] || f == [" ","#{self.token}"," "] || f == [" "," ","#{self.token}"]
        computer_move = 2 if board.cells[2] == " "
        computer_move = 5 if board.cells[5] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif f == ["#{self.token}","#{self.token}"," "] || f == [" ","#{self.token}","#{self.token}"] || f == ["#{self.token}"," ","#{self.token}"]
        computer_move = 2 if board.cells[2] == " "
        computer_move = 5 if board.cells[5] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif g == [" "," "," "] || g == ["#{self.token}"," "," "] || g == [" ","#{self.token}"," "] || g == [" "," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif g == ["#{self.token}","#{self.token}"," "] || g == [" ","#{self.token}","#{self.token}"] || g == ["#{self.token}"," ","#{self.token}"]
        computer_move = 0 if board.cells[0] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 8 if board.cells[8] == " "

      elsif h == [" "," "," "] || h == ["#{self.token}"," "," "] || h == [" ","#{self.token}"," "] || h == [" "," ","#{self.token}"]
        computer_move = 6 if board.cells[6] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 2 if board.cells[2] == " "

      elsif h == ["#{self.token}","#{self.token}"," "] || h == [" ","#{self.token}","#{self.token}"] || h == ["#{self.token}"," ","#{self.token}"]
        computer_move = 6 if board.cells[6] == " "
        computer_move = 4 if board.cells[4] == " "
        computer_move = 2 if board.cells[2] == " "

      else
        computer_move = board.cells.index(" ") unless !board.cells.include?(" ")
      end

        computer_move = computer_move.to_i + 1
        computer_move = computer_move.to_s
        computer_move if board.valid_move?(computer_move)
    end
  end
end
#binding.pry
