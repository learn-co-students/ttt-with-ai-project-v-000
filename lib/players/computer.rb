require 'pry'
class Computer < Player

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
 ]

  def valid_move?(position, cell_array)
    if position.to_i >= 1 && position.to_i <= 9
      return true if !taken?(position, cell_array)
    else
      return false
    end
  end

  def taken?(position, cell_array)
    cell_array[position.to_i - 1] == " " ? false : true
  end


  def move(board)

    if self.token == "X"
        opponent_token = "O"
    elsif self.token == "O"
        opponent_token = "X"
    end

    num_filled_cells = 0
    board.cells.each {|cell| num_filled_cells += 1 if cell != " "}

    if (num_filled_cells == 0 || num_filled_cells == 1) && valid_move?(5, board.cells)

        position = "5"
        return position
    elsif (num_filled_cells == 0 || num_filled_cells == 1) && !valid_move?(5, board.cells)
        position = [1,3,7,9].sample.to_s
        return position
    else

        WIN_COMBINATIONS.each {|element|

          #Win - If computer has 2 in a row, place a 3rd token in the same row
          if board.cells[element[0]] == self.token && board.cells[element[1]] == self.token && valid_move?(element[2]+1, board.cells)
            return (element[2]+1).to_s
          elsif board.cells[element[0]] == self.token && board.cells[element[2]] == self.token && valid_move?(element[1]+1, board.cells)
            return (element[1]+1).to_s
          elsif (board.cells[element[1]] == opponent_token) && (board.cells[element[0]] == opponent_token) && valid_move?(element[2]+1, board.cells)
            return (element[2]+1).to_s
          elsif (board.cells[element[1]] == opponent_token) && (board.cells[element[2]] == opponent_token) && valid_move?(element[0]+1, board.cells)
            return (element[0]+1).to_s
          elsif (board.cells[element[2]] == opponent_token) && (board.cells[element[1]] == opponent_token) && valid_move?(element[0]+1, board.cells)
            return (element[0]+1).to_s
          elsif (board.cells[element[2]] == opponent_token) && (board.cells[element[0]] == opponent_token) && valid_move?(element[1]+1, board.cells)
            return (element[1]+1).to_s

            #Block - If the opponent has 2 in a row, place computer's token in the same row
          elsif (board.cells[element[0]] == opponent_token) && (board.cells[element[1]] == opponent_token) && valid_move?(element[2]+1, board.cells)
            return (element[2]+1).to_s
          elsif (board.cells[element[0]] == opponent_token) && (board.cells[element[2]] == opponent_token) && valid_move?(element[1]+1, board.cells)
            return (element[1]+1).to_s
          elsif (board.cells[element[1]] == opponent_token) && (board.cells[element[0]] == opponent_token) && valid_move?(element[2]+1, board.cells)
            return (element[2]+1).to_s
          elsif (board.cells[element[1]] == opponent_token) && (board.cells[element[2]] == opponent_token) && valid_move?(element[0]+1, board.cells)
            return (element[0]+1).to_s
          elsif (board.cells[element[2]] == opponent_token) && (board.cells[element[1]] == opponent_token) && valid_move?(element[0]+1, board.cells)
            return (element[0]+1).to_s
          elsif (board.cells[element[2]] == opponent_token) && (board.cells[element[0]] == opponent_token) && valid_move?(element[1]+1, board.cells)
            return (element[1]+1).to_s
          end
        }


         #Fork - If computer has corner, and the opponent has the center, take the corner that's in the same row as computer's current move
          if board.cells[0] == self.token && board.cells[4] == opponent_token && valid_move?(3, board.cells)
            return "3"

          elsif board.cells[2] == self.token && board.cells[4] == opponent_token && valid_move?(1, board.cells)
            return "1"

          elsif board.cells[6] == self.token && board.cells[4] == opponent_token && valid_move?(9, board.cells)
            return "9"

          elsif board.cells[8] == self.token && board.cells[4] == opponent_token && valid_move?(7, board.cells)
            return "7"

          elsif (board.cells[0] == opponent_token && board.cells[4] == self.token && board.cells[8] == opponent_token) && (valid_move?(2, board.cells) && valid_move?(4, board.cells) && valid_move?(6, board.cells) && valid_move?(8, board.cells))
             position = [2,4,6,8].sample.to_s
             return position
          elsif (board.cells[2] == opponent_token && board.cells[4] == self.token && board.cells[6] == opponent_token) && (valid_move?(2, board.cells) && valid_move?(4, board.cells) && valid_move?(6, board.cells) && valid_move?(8, board.cells))
             position = [2,4,6,8].sample.to_s
             return position

          elsif (board.cells[6] == opponent_token && board.cells[4] == opponent_token && board.cells[2] == self.token) && (valid_move?(0, board.cells) && valid_move?(8, board.cells))
             position = [1,9].sample.to_s
             return position
          elsif (board.cells[8] == opponent_token && board.cells[4] == opponent_token && board.cells[0] == self.token) && (valid_move?(2, board.cells) && valid_move?(6, board.cells))
             position = [3,7].sample.to_s
             return position
          elsif (board.cells[0] == opponent_token && board.cells[4] == opponent_token && board.cells[8] == self.token) && (valid_move?(2, board.cells) && valid_move?(6, board.cells))
             position = [3,7].sample.to_s
             return position
          elsif (board.cells[2] == opponent_token && board.cells[4] == opponent_token && board.cells[6] == self.token) && (valid_move?(0, board.cells) && valid_move?(8, board.cells))
             position = [1,9].sample.to_s
             return position

          #Corner move - If the opponent is in a corner, take the opposite corner
          elsif board.cells[0] == opponent_token && valid_move?(9, board.cells)
            return "9"
          elsif board.cells[8] == opponent_token && valid_move?(1, board.cells)
            return "1"
          elsif board.cells[2] == opponent_token && valid_move?(7, board.cells)
            return "7"
          elsif board.cells[6] == opponent_token && valid_move?(3, board.cells)
            return "3"
          else
              position = Random.new.rand(1...10).to_s
              return position
          end
    end
  end

end