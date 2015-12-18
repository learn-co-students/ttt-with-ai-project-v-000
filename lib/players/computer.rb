class Computer < Player

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Vertical row
  [1,4,7],  # Vertical Middle row
  [2,5,8],  # Vertical row
  [0,4,8],  # Diagonal Row
  [6,4,2]   # Diagonal Row
  ]

  def opponent_token
    token == "X" ? "O" : "X"
  end

  def move(board)
    if winnable(board)
      (winnable(board) + 1).to_s
    elsif block(board)
      (block(board) + 1).to_s
    else
      (highest_score(board) + 1).to_s
    end
  end  

    # look for available spaces methdd
    # check for spaces with 
    # check win combinations and see if other player is going to win - block
    # check wincomb for squares that you hold and no one else does 
    # check if the free squares in your win combo contain numbers in potential other win combo
    # if number of squares free that dont match any above the choose random
    # move

    # return possible cells that exist in the currentplayer winning combo, and the other players winning combo

    # Win: If the player has two in a row, they can place a third to get three in a row.
    # Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
    # Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
    # Blocking an opponent's fork:
    # Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
    # Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
    # Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
    # Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
    # Empty corner: The player plays in a corner square.
    # Empty side: The player plays in a middle square on any of the 4 sides.
  
  def winnable(board)
    valid_win = WIN_COMBINATIONS.detect {|combo| combo.count{|n| board.cells[n] == token} }
    if valid_win == 2
      valid_win.detect {|n| board.cells[n] == " "} 
    end 
  end

  def block(board)
    valid_block = WIN_COMBINATIONS.detect {|combo| combo.count{|n| board.cells[n] == opponent_token} } 
    if valid_block == 2
      valid_block.detect {|n| board.cells[n] == " "}
    end
  end

  def highest_score(board)
    scores = {}
    board.cells.each_with_index do |cell, index|
      scores[index] = 0

      WIN_COMBINATIONS.each do |combo|
        if combo.include?(index) && no_opponent_marker?(board,combo) && !board.taken?(index + 1)
          scores[index] += 1
        end
      end

      WIN_COMBINATIONS.each do |combo|
        if combo.include?(index) && my_marker_none?(board,combo) && !board.taken?(index + 1)
          scores[index] += (2 * num_of_opponents_markers(board,combo))
        end
      end

      WIN_COMBINATIONS.each do |combo|
        if combo.include?(index) && no_opponent_marker?(board,combo) && !board.taken?(index + 1)
          scores[index] += (3 * num_of_my_markers(board,combo))
        end
      end
    end
    scores.max_by{|k,v| v}[0]
  end

  def no_opponent_marker?(board, combo)
    combo.none? {|n| board.cells[n] == opponent_token}
  end

  def my_marker_none?(board, combo)
    combo.none? {|n| board.cells[n] == token}
  end

  def num_of_opponents_markers(board, combo)
    combo.count {|n| board.cells[n] == opponent_token}
  end

  def num_of_my_markers(board, combo)
    combo.count {|n| board.cells[n] == token}
  end

end  