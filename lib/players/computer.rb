require_relative '../player.rb'

class Player::Computer < Player

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [0, 3, 6],
   [0, 4, 8],
   [1, 4, 7],
   [2, 4, 6],
   [2, 5, 8],
   [3, 4, 5],
   [6, 7, 8]
  ]

  def move(board)
    if pos = win(board)
      return pos
    elsif pos = block(board)
      return pos
    elsif pos = defend(board)
      return pos
    elsif pos = attack(board)
      return pos
    elsif board.cells[4] == " "
      return "5"
    elsif pos = corner(board)
      return pos
    else
      rand(1..9).to_s
    end
  end

  def win(board)
    WIN_COMBINATIONS.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell==@token}.count == 2 && positions.include?(" ")
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  def block(board)
    WIN_COMBINATIONS.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell==@oppenent_token}.count == 2 && positions.include?(" ")
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  def attack(board)
    WIN_COMBINATIONS.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell==@token}.count == 1 && positions.select {|cell| cell == " "}.count == 2
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  def defend(board)
    WIN_COMBINATIONS.each do |combo|
      positions = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
      if positions.select {|cell| cell==@opponent_token}.count == 1 && positions.select {|cell| cell == " "}.count == 2
        blank_combo_index = positions.index(" ")
        blank_index = combo[blank_combo_index]
        pos = blank_index + 1
        return pos
      end
    end
    return false
  end

  def corner(board)
    corners = [0,2,6,8]
    corners.each do |corner|
      if board.cells[corner] == " "
        return corner + 1
      end
    end
    return false
  end


end