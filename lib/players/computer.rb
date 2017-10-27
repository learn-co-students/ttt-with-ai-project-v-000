module Players
  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [6,4,2]]

    def other_token
      token == "X" ? "O" : "X"
    end

    def move(board)
      potential_win = WIN_COMBINATIONS.find do |array|
        (board.cells[0] == token && board.cells[1] == token) && board.cells[2] == " "||
          (board.cells == " " && board.cells[1] == token && board.cells[2] == token) ||
            (board.cells[0] == token && board.cells[1] == " " && board.cells[2] == token)
      end
      other_win = WIN_COMBINATIONS.find do |array|
        (board.cells[0] == other_token && board.cells[1] == other_token) && board.cells[2] == " " ||
          (board.cells[0] == " " && board.cells[1] == other_token && board.cells[2] == other_token) ||
            (board.cells[0] == other_token && board.cells[1] == " " && board.cells[2] == other_token)
      end
      if other_win
        pos = other_win.find { |idx| board.cells[idx] == " " }
        input = (pos + 1).to_s
      elsif potential_win
        pos = potential_win.find { |idx| board.cells[idx] == " " }
        input = (pos + 1).to_s
      else
        input = rand(1..9).to_s
      end
    end

  end
end
