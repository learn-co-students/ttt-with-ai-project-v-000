require "pry"
module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def move(board)
      return self.win_array(board) unless self.win_array(board) == nil
      return self.lose_array(board) unless self.lose_array(board) == nil
      self.non_winning_moves(board)
    end


    def win_array(board)
      WIN_COMBINATIONS.each do |win|
        if board.cells[win[0]] == self.token && board.cells[win[1]] == self.token && board.cells[win[2]] == " "
          return "#{win[2]+1}"
        elsif board.cells[win[1]] == self.token && board.cells[win[2]] == self.token && board.cells[win[0]] == " "
          return "#{win[0]+1}"
        elsif board.cells[win[0]] == self.token && board.cells[win[2]] == self.token && board.cells[win[1]] == " "
          return "#{win[1]+1}"
        end
      end
      nil
    end

    def lose_array(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      WIN_COMBINATIONS.each do |win|
        if board.cells[win[0]] == opponent_token && board.cells[win[1]] == opponent_token && board.cells[win[2]] == " "
          return "#{win[2]+1}"
        elsif board.cells[win[1]] == opponent_token && board.cells[win[2]] == opponent_token && board.cells[win[0]] == " "
          return "#{win[0]+1}"
        elsif board.cells[win[0]] == opponent_token && board.cells[win[2]] == opponent_token && board.cells[win[1]] == " "
          return "#{win[1]+1}"
        end
      end
      nil
    end

    def non_winning_moves(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
        if board.turn_count == 0
          return "1"
        elsif board.cells[4] == " "
          return "5"
        elsif board.cells[4] != self.token
          temp = [0,2,6,8]
          temp.each do |check|
            if board.cells[check] == " "
              return "#{check + 1}"
            end
          end
        elsif board.cells[4] == self.token
          temp = [1,3,5,7]
          temp.each do |check|
            if board.cells[check] == " "
              break "#{check + 1}"
            end
          end
        else
          (1..9).each do |location|
            return "#{location}" if board.cells[location-1] == " "
          end
        end
    end
  end
end
