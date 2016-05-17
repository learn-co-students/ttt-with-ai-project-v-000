class Player::Computer < Player
    attr_accessor :board

  def move(board)
    move_options(board)

  end

  def other_player
    if @token == "X"
      "O"
    else
      "X"
    end
  end

  def move_options(board)
      cells = board.cells
      if cells[4] == " "
        return "5"
      elsif (cells[0] == @token && cells[1] == @token && cells[2] == " ")
          return "3"
      elsif (cells[0] == @token && cells[2] == @token && cells[1] == " ")
          return "2"
      elsif (cells[1] == @token && cells[2] == @token && cells[0] == " ")
          return "1"
      elsif (cells[3] == @token && cells[4] == @token && cells[5] == " ")
          return "6"
      elsif (cells[3] == @token && cells[5] == @token && cells[4] == " ")
          return "5"
      elsif (cells[4] == @token && cells[5] == @token && cells[3] == " ")
          return "4"
      elsif (cells[6] == @token && cells[7] == @token && cells[8] == " ")
          return "9"
      elsif (cells[6] == @token && cells[8] == @token && cells[7] == " ")
          return "8"
      elsif (cells[7] == @token && cells[8] == @token && cells[6] == " ")
          return "7"
      elsif (cells[0] == @token && cells[3] == @token && cells[6] == " ")
          return "7"
      elsif (cells[0] == @token && cells[6] == @token && cells[3] == " ")
          return "4"
      elsif (cells[3] == @token && cells[6] == @token && cells[0] == " ")
          return "1"
      elsif (cells[1] == @token && cells[4] == @token && cells[7] == " ")
          return "8"
      elsif (cells[1] == @token && cells[7] == @token && cells[4] == " ")
          return "5"
      elsif (cells[4] == @token && cells[7] == @token && cells[1] == " ")
          return "2"
      elsif (cells[2] == @token && cells[5] == @token && cells[8] == " ")
          return "9"
      elsif (cells[2] == @token && cells[8] == @token && cells[5] == " ")
          return "6"
      elsif (cells[5] == @token && cells[8] == @token && cells[2] == " ")
          return "3"
      elsif (cells[0] == @token && cells[4] == @token && cells[8] == " ")
          return "9"
      elsif (cells[0] == @token && cells[8] == @token && cells[4] == " ")
          return "5"
      elsif (cells[4] == @token && cells[8] == @token && cells[0] == " ")
          return "1"
      elsif (cells[6] == @token && cells[4] == @token && cells[2] == " ")
          return "3"
      elsif (cells[6] == @token && cells[2] == @token && cells[4] == " ")
          return "5"
      elsif (cells[4] == @token && cells[2] == @token && cells[6] == " ")
          return "7"
      elsif (cells[0] == other_player && cells[1] == other_player && cells[2] == " ")
          return "3"
      elsif (cells[0] == other_player && cells[2] == other_player && cells[1] == " ")
          return "2"
      elsif (cells[1] == other_player && cells[2] == other_player && cells[0] == " ")
          return "1"
      elsif (cells[3] == other_player && cells[4] == other_player && cells[5] == " ")
          return "6"
      elsif (cells[3] == other_player && cells[5] == other_player && cells[4] == " ")
          return "5"
      elsif (cells[4] == other_player && cells[5] == other_player && cells[3] == " ")
          return "4"
      elsif (cells[6] == other_player && cells[7] == other_player && cells[8] == " ")
          return "9"
      elsif (cells[6] == other_player && cells[8] == other_player && cells[7] == " ")
          return "8"
      elsif (cells[7] == other_player && cells[8] == other_player && cells[6] == " ")
          return "7"
      elsif (cells[0] == other_player && cells[3] == other_player && cells[6] == " ")
          return "7"
      elsif (cells[0] == other_player && cells[6] == other_player && cells[3] == " ")
          return "4"
      elsif (cells[3] == other_player && cells[6] == other_player && cells[0] == " ")
          return "1"
      elsif (cells[1] == other_player && cells[4] == other_player && cells[7] == " ")
          return "8"
      elsif (cells[1] == other_player && cells[7] == other_player && cells[4] == " ")
          return "5"
      elsif (cells[4] == other_player && cells[7] == other_player && cells[1] == " ")
          return "2"
      elsif (cells[2] == other_player && cells[5] == other_player && cells[8] == " ")
          return "9"
      elsif (cells[2] == other_player && cells[8] == other_player && cells[5] == " ")
          return "6"
      elsif (cells[5] == other_player && cells[8] == other_player && cells[2] == " ")
          return "3"
      elsif (cells[0] == other_player && cells[4] == other_player && cells[8] == " ")
          return "9"
      elsif (cells[0] == other_player && cells[8] == other_player && cells[4] == " ")
          return "5"
      elsif (cells[4] == other_player && cells[8] == other_player && cells[0] == " ")
          return "1"
      elsif (cells[6] == other_player && cells[4] == other_player && cells[2] == " ")
          return "3"
      elsif (cells[6] == other_player && cells[2] == other_player && cells[4] == " ")
          return "5"
      elsif (cells[4] == other_player && cells[2] == other_player && cells[6] == " ")
          return "7"
        elsif cells[0] == " " || cells[2] == " " || cells[6] == " " || cells[8] == " "
          ['1','3','7','9'].sample
      else
          return rand(1..9).to_s
      end
  end
end
