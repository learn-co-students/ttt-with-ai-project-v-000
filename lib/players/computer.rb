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
    BLOCK_COMBINATIONS = [
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
    binding.pry
    if board.turn_count <= 2
      avail_corners
    elsif win_or_block == nil || win_or_block == false
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
    board.turn_count.even? ? "X" : "O"
  end

  def opponent_token
    board.turn_count.even? ? "O" : "X"
  end

  def block_the_win
    BLOCK_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token) || (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token) || (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token)
        #return which number is false
        @block = combo.detect {|num| board.cells[num] != opponent_token}
        @block = @block+1
      else
        @block = nil
      end
    end
    BLOCK_COMBINATIONS.delete(block)

    @block
  end

  def win_combo
    WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] == who_goes? && board.cells[combo[1]] == who_goes?) || (board.cells[combo[0]] == who_goes? && board.cells[combo[2]] == who_goes?) || (board.cells[combo[1]] == who_goes? && board.cells[combo[2]] == who_goes?)
        #return which number is false
        @win = combo.detect {|num| board.cells[num] != who_goes?}
        @win = @win+1
      else
        @win = nil
      end
    end
    WIN_COMBINATIONS.delete(win)
    @win
  end

  def win_or_block
    # win_combo
    # if win_combo == nil
    #   block_the_win
    if board.valid_move?(win_combo)
      win_combo
    elsif board.valid_move?(block_the_win) == false
      nil
    else
      block_the_win
    end
  end













end