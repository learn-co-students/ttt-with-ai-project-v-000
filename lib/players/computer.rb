module Players
  class Computer < Player

    def move(board = Board.new)
      if board.turn_count == 0 || board.turn_count == 2
        corner_move(board)
      elsif board.turn_count == 1 && !board.taken?(5)
        move = "5"
      elsif board.turn_count == 3
        if check_if_self_can_win(board)
          check_if_self_can_win(board)
        elsif check_if_opponent_can_win(board)
          check_if_opponent_can_win(board)
        else
          corner_move(board)
        end
      elsif board.turn_count >3
        if check_if_self_can_win(board)
          check_if_self_can_win(board)
        elsif check_if_opponent_can_win(board)
          check_if_opponent_can_win(board)
        elsif corner_move(board)
          corner_move(board)
        else
          random_move(board)
        end
      end
    end

    def corner_move(board = Board.new)
      [1,3,7,9].detect{|x| !board.taken?(x)}.to_s
    end

    def random_move(board = Board.new)
      [1,2,3,4,5,6,7,8,9].detect{|x| !board.taken?(x)}.to_s
    end

    def check_if_self_can_win(board = Board.new)
      #looks for horizontal possible wins for self
      #looks for top left and top right taken by self, moves to top middle
      if board.cells[0] == self.token && board.cells[0] != " " && board.cells[2] == self.token && board.cells[2] != " " && !board.taken?(2)
        move = "2"
      #looks for top left and top middle taken by self, moves to top right
      elsif board.cells[0] == self.token && board.cells[0] != " " && board.cells[1] == self.token && board.cells[1] != " " && !board.taken?(3)
        move = "3"
      #looks for top middle and top right taken by self, moves to top left
      elsif board.cells[1] == self.token && board.cells[1] != " " && board.cells[2] == self.token && board.cells[2] != " " && !board.taken?(1)
        move = "1"
      #looks for middle left and middle right taken by self, moves to middle
      elsif board.cells[3] == self.token && board.cells[3] != " " && board.cells[5] == self.token && board.cells[5] != " " && !board.taken?(5)
        move = "5"
      #looks middle left and middle taken by self, moves to middle right
      elsif board.cells[3] == self.token && board.cells[3] != " " && board.cells[4] == self.token && board.cells[4] != " " && !board.taken?(6)
        move = "6"
      #looks for middle and middle right taken by self, moves to middle left
      elsif board.cells[4] == self.token && board.cells[4] != " " && board.cells[5] == self.token && board.cells[5] != " " && !board.taken?(4)
        move = "4"
      #looks for bottom left and bottom right taken by self, moves to bottom middle
      elsif board.cells[6] == self.token && board.cells[6] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(8)
        move = "8"
      #looks for bottom left and bottom middle taken by self, moves to bottom right
      elsif board.cells[6] == self.token && board.cells[6] != " " && board.cells[7] == self.token && board.cells[7] != " " && !board.taken?(9)
        move = "9"
      #looks for bottom middle and bottom right taken by self, moves to bottom left
      elsif board.cells[7] == self.token && board.cells[7] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(7)
        move = "7"

      #looks for vertical possible wins for self
      #looks for top left and bottom left taken by self, moves to left middle
      elsif board.cells[0] == self.token && board.cells[0] != " " && board.cells[6] == self.token && board.cells[6] != " " && !board.taken?(4)
        move = "4"
      #looks for top left and middle left taken by self, moves to bottom left
      elsif board.cells[0] == self.token && board.cells[0] != " " && board.cells[3] == self.token && board.cells[3] != " " && !board.taken?(7)
        move = "7"
      #looks for middle left and bottom left taken by self, moves to top left
      elsif board.cells[3] == self.token && board.cells[3] != " " && board.cells[6] == self.token && board.cells[6] != " " && !board.taken?(1)
        move = "1"
      #looks for top middle and bottom middle taken by self, moves to middle
      elsif board.cells[1] == self.token && board.cells[1] != " " && board.cells[7] == self.token && board.cells[7] != " " && !board.taken?(5)
        move = "5"
      #looks for top middle and middle taken by self, moves to bottom middle
      elsif board.cells[1] == self.token && board.cells[1] != " " && board.cells[4] == self.token && board.cells[4] != " " && !board.taken?(8)
        move = "8"
      #looks for middle and bottom middle taken by self, moves to top middle
      elsif board.cells[4] == self.token && board.cells[4] != " " && board.cells[7] == self.token && board.cells[7] != " " && !board.taken?(2)
        move = "2"
      #looks for top right and bottom right taken by self, moves to middle right
      elsif board.cells[2] == self.token && board.cells[2] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(6)
        move = "6"
      #looks for top right and middle right taken by self, moves to bottom right
      elsif board.cells[2] == self.token && board.cells[2] != " " && board.cells[5] == self.token && board.cells[5] != " " && !board.taken?(9)
        move = "9"
      #looks for middle right and bottom right taken by self, moves to top right
      elsif board.cells[5] == self.token && board.cells[5] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(3)
        move = "3"

      #looks for diagnal possible wins for self
      #looks for top left and bottom right taken by self, moved to middle
      elsif board.cells[0] == self.token && board.cells[0] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(5)
        move = "5"
      #looks for top left and middle taken by self, moves to bottom right
      elsif board.cells[0] == self.token && board.cells[0] != " " && board.cells[4] == self.token && board.cells[4] != " " && !board.taken?(9)
        move = "9"
      #looks for middle and bottom right taken by self, moves to top left
      elsif board.cells[4] == self.token && board.cells[4] != " " && board.cells[8] == self.token && board.cells[8] != " " && !board.taken?(1)
        move = "1"
      #looks for top right and bottom left taken by self, moves to middle
      elsif board.cells[2] == self.token && board.cells[2] != " " && board.cells[6] == self.token && board.cells[6] != " " && !board.taken?(5)
        move = "5"
      #looks for top right and middle taken by self, moves to bottom left
      elsif board.cells[2] == self.token && board.cells[2] != " " && board.cells[4] == self.token && board.cells[4] != " " && !board.taken?(7)
        move = "7"
      #look or middle and bottom left taken by self, moves to top right
      elsif board.cells[4] == self.token && board.cells[4] != " " && board.cells[6] == self.token && board.cells[6] != " " && !board.taken?(3)
        move = "3"
      else
      end
    end

    def check_if_opponent_can_win(board = Board.new)
      #looks for horizontal possible wins for opponent
      #looks for top left and top right taken by opponent, moves to top middle
      if board.cells[0] != self.token && board.cells[0] != " " && board.cells[2] != self.token && board.cells[2] != " " && !board.taken?(2)
        move = "2"
      #looks for top left and top middle taken by opponent, moves to top right
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[1] != self.token && board.cells[1] != " " && !board.taken?(3)
        move = "3"
      #looks for top middle and top right taken by opponent, moves to top left
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[2] != self.token && board.cells[2] != " " && !board.taken?(1)
        move = "1"
      #looks for middle left and middle right taken by opponent, moves to middle
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[5] != self.token && board.cells[5] != " " && !board.taken?(5)
        move = "5"
      #looks middle left and middle taken by opponent, moves to middle right
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[4] != self.token && board.cells[4] != " " && !board.taken?(6)
        move = "6"
      #looks for middle and middle right taken by opponent, moves to middle left
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[5] != self.token && board.cells[5] != " " && !board.taken?(4)
        move = "4"
      #looks for bottom left and bottom right taken by opponent, moves to bottom middle
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(8)
        move = "8"
      #looks for bottom left and bottom middle taken by opponent, moves to bottom right
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[7] != self.token && board.cells[7] != " " && !board.taken?(9)
        move = "9"
      #looks for bottom middle and bottom right taken by opponent, moves to bottom left
      elsif board.cells[7] != self.token && board.cells[7] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(7)
        move = "7"

      #looks for vertical possible wins for opponent
      #looks for top left and bottom left taken by opponent, moves to left middle
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[6] != self.token && board.cells[6] != " " && !board.taken?(4)
        move = "4"
      #looks for top left and middle left taken by opponent, moves to bottom left
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[3] != self.token && board.cells[3] != " " && !board.taken?(7)
        move = "7"
      #looks for middle left and bottom left taken by opponent, moves to top left
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[6] != self.token && board.cells[6] != " " && !board.taken?(1)
        move = "1"
      #looks for top middle and bottom middle taken by opponent, moves to middle
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[7] != self.token && board.cells[7] != " " && !board.taken?(5)
        move = "5"
      #looks for top middle and middle taken by opponent, moves to bottom middle
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[4] != self.token && board.cells[4] != " " && !board.taken?(8)
        move = "8"
      #looks for middle and bottom middle taken by opponent, moves to top middle
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[7] != self.token && board.cells[7] != " " && !board.taken?(2)
        move = "2"
      #looks for top right and bottom right taken by opponent, moves to middle right
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(6)
        move = "6"
      #looks for top right and middle right taken by opponent, moves to bottom right
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[5] != self.token && board.cells[5] != " " && !board.taken?(9)
        move = "9"
      #looks for middle right and bottom right taken by opponent, moves to top right
      elsif board.cells[5] != self.token && board.cells[5] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(3)
        move = "3"

      #looks for diagnal possible wins for opponent
      #looks for top left and bottom right taken by opponent, moved to middle
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(5)
        move = "5"
      #looks for top left and middle taken by opponent, moves to bottom right
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[4] != self.token && board.cells[4] != " " && !board.taken?(9)
        move = "9"
      #looks for middle and bottom right taken by opponent, moves to top left
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[8] != self.token && board.cells[8] != " " && !board.taken?(1)
        move = "1"
      #looks for top right and bottom left taken by opponent, moves to middle
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[6] != self.token && board.cells[6] != " " && !board.taken?(5)
        move = "5"
        #looks for top right and middle taken by opponent, moves to bottom left
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[4] != self.token && board.cells[4] != " " && !board.taken?(7)
        move = "7"
      #look or middle and bottom left taken by opponent, moves to top right
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[6] != self.token && board.cells[6] != " " && !board.taken?(3)
        move = "3"
      else
      end
    end
  end
end
