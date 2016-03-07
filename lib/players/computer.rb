class Computer < Player # inherits from Player

  attr_accessor :winning_row, :winning_col, :winning_diag


  # returns a valid position for the computer to move
  def move(board)

    # set up winning arrays
    set_winners(board)

    # waits 0.5 seconds to make a move
    sleep(0.5)
    board.available_moves.sample

  end

  def set_winners(board)
    @winning_row = [
        [board.cells[0],board.cells[1],board.cells[2]],  # row
        [board.cells[3],board.cells[4],board.cells[5]],  # row
        [board.cells[6],board.cells[7],board.cells[8]]   # row
    ]
    @winning_col = [
        [board.cells[0],board.cells[3],board.cells[6]],  # col
        [board.cells[1],board.cells[4],board.cells[7]],  # col
        [board.cells[2],board.cells[5],board.cells[8]],  # col
    ]
    @winning_diag = [
        [board.cells[0],board.cells[4],board.cells[8]],  # diag
        [board.cells[6],board.cells[4],board.cells[2]],  # diag
    ]
  end



  def two_in_a_row
    # the following gives us something to check our winning arrays against
    # [["X", "X", " "], ["X", " ", "X"], [" ", "X", "X"]]
    [token, token, ' '].permutation.to_a.uniq
  end


  # use the pattern from two_in_a_row to check every @winning_row for a match
  def win_row(board)
    two_in_a_row.any? do |wr|
      winning_row.include?(wr)
    end
  end

  # use the pattern from two_in_a_row to check every @winning_col for a match
  def win_col(board)
    two_in_a_row.any? do |wc|
      winning_col.include?(wc)
    end
  end

  # use the pattern from two_in_a_row to check every @winning_diag for a match
  def win_diag(board)
    two_in_a_row.any? do |wg|
      winning_diag.include?(wg)
    end
  end

end