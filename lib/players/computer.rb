require 'pry'
class Computer < Player
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diag 1
  [6,4,2] # diag 2
]
  def move(board)
    WIN_COMBINATIONS.each do |combo|
      count = 0
      enemycount = 0
      combo.each do |pos|
        if board.cells[pos] == token
          count += 1
          # if i have 2 in a row, win the game
          if count == 2
            if board.cells[combo[2]] == " "
              return makeMove(combo[2])
            elsif board.cells[combo[2]] == self.token
              if board.cells[combo[1]] == " "
                return makeMove(combo[1])
              end
            end
          end
        end
      end
    end


    WIN_COMBINATIONS.each do|combo|
      count = 0
      enemycount = 0
      combo.each do |pos|
        if board.cells[pos] == other_token
          enemycount += 1
          # if enemy has 2 in a row, block his win
          if enemycount == 2
            if board.cells[combo[2]] == " "
              return makeMove(combo[2])
            elsif board.cells[combo[2]] == other_token
              if board.cells[combo[1]] == " "
                return makeMove(combo[1])
              end
            end
          end
        end
      end
    end

   
    if openCorner(board) != nil
      # prioritize corners
      makeMove(openCorner(board))
    elsif board.cells[4] == " "
      # place in middle if not taken
      makeMove(4)
    else
      # place wherever
      makeMove(wherever(board))
    end

  end

  def makeMove(index)
    (index+1).to_s
  end

  def openCorner(board)
    # prioritize opposite corner if enemy placed in middle
    # if board.cells[4] == other_token
    #   if board.cells[0] == token
    #     return 8
    #   elsif board.cells[2] == token
    #     return 6
    #   elsif board.cells[6] == token
    #     return 2
    #   elsif board.cells[8] == token
    #     return 0
    #   end
    # end

    if board.cells[0] == " "
      0
    elsif board.cells[2] == " "
      2
    elsif board.cells[6] == " "
      6
    elsif board.cells[8] == " "
      8
    else
      nil
    end
  end

  def wherever(board)
    for i in 0..8
      if board.cells[i] == " "
        return i
      end
    end
  end


end

