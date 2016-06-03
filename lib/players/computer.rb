require'pry'
class Player::Computer < Player

  attr_accessor :board, :block, :win
    WIN_COMBINATIONS = [
                      [0,1,2],#Top Three
                      [3,4,5],#Middle Three
                      [6,7,8],#Bottom Three
                      [0,3,6],#L Vertical
                      [1,4,7],#M Vertical
                      [2,5,8],#R Vertical
                      [0,4,8],#L-R Diagonal
                      [6,4,2]#R-L Diagonal
                              ]

  def move(board)
    @board = board
    if board.turn_count <= 3
      avail_corners
    elsif win_or_block == nil
      #this checks the board to see what spots are free and picks a random number
      free_spot = []
      board.cells.each_with_index {|point, index|
      if point == " "
        new_index = index+1
        free_spot << new_index.to_s
      end}
      free_spot.sample
    else
      win_or_block
    end
  end

  def avail_corners
    corner_num = [1, 3, 5, 7, 9]
    corner_num.each do |num|
      # board.valid_move?(num)
      if board.taken?(num) == true
        corner_num.delete(num)
      end
    end
    corner_num.sample
  end

  def who_goes?
    board.turn_count.odd? ? "X" : "O"
  end

  def opponent_token
    board.turn_count.odd? ? "O" : "X"
  end

  def block_the_win
    WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token) || (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token) || (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token)
        #return which number is false
        @block = combo.detect {|num| board.cells[num] != opponent_token}
      else
        @block = nil
      end
    end
    @block
  end

  def win_combo
    WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] == who_goes? && board.cells[combo[1]] == who_goes?) || (board.cells[combo[0]] == who_goes? && board.cells[combo[2]] == who_goes?) || (board.cells[combo[1]] == who_goes? && board.cells[combo[2]] == who_goes?)
        #return which number is false
        @block = combo.detect {|num| board.cells[num] != who_goes?}
      else
        @block = nil
      end
    end
    @block
  end

  def win_or_block
    win_combo
    if win_combo == nil
      block_the_win
    end
  end













end