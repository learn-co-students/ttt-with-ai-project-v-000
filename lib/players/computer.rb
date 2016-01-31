class Player::Computer < Player

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def move(board)
    if pos = go_for_win(board)
      return pos
    elsif pos = block(board)
      return pos
    elsif pos = defend(board)
      return pos
    elsif pos = attack(board)
      return pos
    elsif board.cells[4] == " " #grabs center position if available
      return "5"
    elsif pos = grab_corner(board)
      return pos
    else
      rand(1..9).to_s
    end
  end

  # Moves to get a win if available.
  def go_for_win(board)
    win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    win_combos.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell == @token}.count == 2 && positions.include?(" ")
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  # Blocks opponent from getting winning move.
  def block(board)
    win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    win_combos.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell == @opponent_token}.count == 2 && positions.include?(" ")
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  # Attacking move based on if they have 1/3 positions in a possible winning combination.
  def attack(board)
    win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    win_combos.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell == @token}.count == 1 && positions.select {|cell| cell == " "}.count == 2
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  # Defensive move based on if opponent has 1/3 positions in a possible winning combination.
  def defend(board)
    win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    win_combos.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell == @opponent_token}.count == 1 && positions.select {|cell| cell == " "}.count == 2
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  # Gets a corner position if available.
  def grab_corner(board)
    corners = [0,2,6,8]
    corners.each do |corner|
      if board.cells[corner] == " "
        return corner + 1
      end
    end
    return false
  end  
end

