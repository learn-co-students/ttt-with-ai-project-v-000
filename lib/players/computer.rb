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
    if board.turn_count <= 2
      avail_corners
    elsif win_or_block == false
      #this checks the board to see what spots are free and picks a random number
      random_number
    else
      board.valid_move?(win_or_block) ? win_or_block : random_number
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

  def random_number
    free_spot = []
      board.cells.each_with_index do |point, index|
        if point == " "
          new_index = index+1
          free_spot << new_index.to_s
        end
    end
    free_spot.sample
  end


  def who_goes?
    board.turn_count.even? ? "X" : "O"
  end

  def opponent_token
    board.turn_count.even? ? "O" : "X"
  end

  def block_the_win
    # binding.pry
    @final_combo_index_b = []
    @final_combo_b = []
    @block = nil
    true_combo = BLOCK_COMBINATIONS.map {|combo| (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token) || (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token) || (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token) }
    true_combo.each do |x|
      if x == true
        @final_combo_index_b << true_combo.index(x)
      end
    end
    #have to fix the index on line 79. It constantly returns 0 since index is equal to 0
    @final_combo_index_b.each {|x| BLOCK_COMBINATIONS[x].each {|y| @final_combo_b << y }}
    # @final_combo_index.each {|x| BLOCK_COMBINATIONS.delete_at(x)}
    @block = @final_combo_b.detect {|x| board.cells[x] == " "}
    @block == nil ? @block : @block+1




    # BLOCK_COMBINATIONS.collect do |combo|
    #   if (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token) || (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token) || (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token)
    #     #return which number is false
    #     @final_combo << combo
    #     # @block = combo.detect {|num| board.cells[num] != opponent_token}
    #   else
    #     @block = nil
    #   end
    #   @final_combo.detect {|num| board.cells[num] == " "}
    # end


    # BLOCK_COMBINATIONS.detect do |combo|
    #   if (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token) || (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token) || (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token)
    #     #return which number is false
    #     @block = combo.detect {|num| board.cells[num] != opponent_token}
    #     board.valid_move?(@block) ? @block = @block+1 : block_the_win
    #   else
    #     @block = nil
    #   end
    # end

    # BLOCK_COMBINATIONS.delete(block)
  end

  def win_combo
    @final_combo_index_w = []
    @final_combo_w = []
    @win = nil
    true_combo = WIN_COMBINATIONS.map {|combo| (board.cells[combo[0]] == who_goes? && board.cells[combo[1]] == who_goes?) || (board.cells[combo[0]] == who_goes? && board.cells[combo[2]] == who_goes?) || (board.cells[combo[1]] == who_goes? && board.cells[combo[2]] == who_goes?) }
    true_combo.each do |x|
      if x == true
        @final_combo_index_w << true_combo.index(x)
      end
    end
    #have to fix the index on line 79. It constantly returns 0 since index is equal to 0
    @final_combo_index_w.each {|x| WIN_COMBINATIONS[x].each {|y| @final_combo_w << y }}
    # @final_combo_index.each {|x| WIN_COMBINATIONS.delete_at(x)}
    @win = @final_combo_w.detect {|x| board.cells[x] == " "}
    @win == nil ? @win : @win+1








    # WIN_COMBINATIONS.detect do |combo|
    #   if (board.cells[combo[0]] == who_goes? && board.cells[combo[1]] == who_goes?) || (board.cells[combo[0]] == who_goes? && board.cells[combo[2]] == who_goes?) || (board.cells[combo[1]] == who_goes? && board.cells[combo[2]] == who_goes?)
    #     #return which number is false
    #     @win = combo.detect {|num| board.cells[num] != who_goes?}
    #     board.valid_move?(@win) ? @win = @win+1 : win_combo
    #   else
    #     @win = nil
    #   end
    # end
    # WIN_COMBINATIONS.delete(win)
    # @win
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