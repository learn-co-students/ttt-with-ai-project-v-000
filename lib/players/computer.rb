require'pry'
class Player::Computer < Player

  attr_accessor :board, :how_many_trues, :win, :block
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
    if board.turn_count <= 2
      avail_corners
    elsif find_or_block_winning_combination == nil
      avail_corners
    else
      find_or_block_winning_combination
      # free_spot = []
      # board.cells.each_with_index {|point, index|
      # if point == " "
      #   new_index = index+1
      #   free_spot << new_index.to_s
      # end}
      # free_spot.sample
    end

  end

    #use .delete, iterate through the array.
#another idea can be, have a couple set of arrays. when .moves is 1(or 2) or less, .random.pop (to pick random and to remove from the array incanse it
#has to go through again.) from array [1, 3, 7, 9], then have it run through the valid_move? method and if valid_move? == false or nil,
#then go through the array again until a number is given. 
      # if board.turn_count == 1
      #   corner_num = [1, 3, 7, 9]
      #   random_num = corner_num.sample
        #Can use an .include? method to see if both arrays contain the same number, if not cycle again.

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

  def find_or_block_winning_combination
    #reason why it's failing is because block_win is running twice causing the .each to run on a single number, not an array and messing up
    if block_win == nil     
      find_win
    else
      block
      binding.pry
    end
    #even numbers = O, odd numbers = X
    #iterate through the win combos with 3 variables. Go through board and see if there are any combos that match 2 numbers in any array
    #then pick the last number that is missing from that array
  end

  def x_or_o #determines who currently goes
    if board.turn_count.odd?
      "O"
    else
      "X"
    end
  end  

  def x_or_o_inverse #determines who currently goes
    if board.turn_count.even?
      "O"
    else
      "X"
    end
  end

  def block_win
    WIN_COMBINATIONS.each {|a, b, c|
    how_many_trues = [] 
      if (board.cells[a] == x_or_o) == true
        how_many_trues << true
      end
      if (board.cells[b] == x_or_o) == true
        how_many_trues << true
      end
      if (board.cells[c] == x_or_o) == true
        how_many_trues << true
      end
      if how_many_trues.length == 2
        @block = [a, b, c]
      end
    }
      WIN_COMBINATIONS.delete(@block)

    @block.each do |num|
      # binding.pry
      if board.taken?(num+1) == false
        @block = num+1
      end
    end
    @block
  end

  def find_win
    WIN_COMBINATIONS.each {|a, b, c|
    how_many_trues = [] 
      if (board.cells[a] == x_or_o_inverse) == true
        how_many_trues << true
      end
      if (board.cells[b] == x_or_o_inverse) == true
        how_many_trues << true
      end
      if (board.cells[c] == x_or_o_inverse) == true
        how_many_trues << true
      end
      if how_many_trues.length == 2
        @win = [a, b, c]
      end
    }
      # WIN_COMBINATIONS.delete(@win)

    @win.find do |num|
      if board.taken?(num+1) == false
        @win = num+1
      end
    end
    @win
    end





end