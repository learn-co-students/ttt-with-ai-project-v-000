class Computer < Player # inherits from Player

  attr_accessor :winning_row, :winning_col, :winning_diag, :board


  # returns a valid position for the computer to move
  def move(board)

    @board = board

    # set up winning arrays
    set_winners #(board)

    # waits 0.5 seconds to make a move
    sleep(0.5)

    if win_row
      # val is the array index for our @winning_row (it will be 0 || 1|| 2)
      val = winning_row[win_row].find_index { |cell| cell == " " }
      case win_row
        when 0
          val += 1
        when 1
          val += 4
        when 2
          val += 7
      end
      val.to_s
    elsif win_col
      # val is the array index for our @winning_col (it will be 0 || 1|| 2)
      val = winning_col[win_col].find_index { |cell| cell == " " }
      case val
        when 0
          val = win_col + val + 1
        when 1
          val = win_col + val + 3
        when 2
          val = win_col + val + 5
      end
      val.to_s
    elsif win_diag
      # val is the array index for our @winning_diag (it will be 0 || 1)
      val = winning_diag[win_diag].find_index { |cell| cell == " " }
      case val
        when 0
          val = win_diag + i + 1
        when 1
          val += 4
      end

      case win_diag
        when 0
          if val == 2
            val += 7
          else
            val +=5
          end
      end
      val.to_s
    else
      board.available_moves.sample
    end

  end

  def set_winners
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


  def two_tokens
    # something to check our set_winners arrays against
    # this generates every possible two-in-a-row pattern for the current token
    # any winning_row, winning_col, or winning_diag would follow this pattern
    # in the future I could see something similar being used for a blocking move
    # [["X", "X", " "], ["X", " ", "X"], [" ", "X", "X"]]
    [token, token, ' '].permutation.to_a.uniq
  end

  # use pattern from two_tokens to check every @winning_row for match
  def win_row
    # if pattern is found, return integer index of the @winning_row array
    winning_row.find_index do |row|
      # see if one of the two_tokens arrays matches one of our board rows
      two_tokens.find {|token| token == row }
    end
  end

  # use pattern from two_tokens to check every @winning_col for match
  def win_col
    winning_col.find_index do |col|
      two_tokens.find {|token| token == col }
    end
  end

  # use pattern from two_tokens to check every @winning_diag for match
  def win_diag
    winning_diag.find_index do |diag|
      two_tokens.find {|token| token == diag }
    end
  end

end