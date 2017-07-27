module Players
  class Computer < Player
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def move(board)
    puts "Computers move...."
    self.board = board
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    if middle?
      "5"
    elsif offensive.is_a?(String)
      offensive
    elsif defensive.is_a?(String)
      defensive
    elsif !get_corners.empty?
      get_corners.sample
    else
      get_first_spot_opened
    end
  end

  def offensive
    WIN_COMBINATIONS.each do |win_combo|
      if self.board.cells[win_combo[0]] == self.token && self.board.cells[win_combo[1]] == self.token && self.board.cells[win_combo[2]] == " "
        return (win_combo[2] + 1).to_s
      elsif self.board.cells[win_combo[0]] == self.token && self.board.cells[win_combo[2]] == self.token && self.board.cells[win_combo[1]] == " "
        return (win_combo[1] + 1).to_s
      elsif self.board.cells[win_combo[1]] == self.token && self.board.cells[win_combo[2]] == self.token && self.board.cells[win_combo[0]] == " "
        return (win_combo[0] + 1).to_s
      end
    end
  end

  def middle?
    !self.board.taken?("5")
  end

  def defensive
    WIN_COMBINATIONS.each do |win_combo|
      if self.board.cells[win_combo[0]] == opp_token && self.board.cells[win_combo[1]] == opp_token && self.board.cells[win_combo[2]] == " "
        return (win_combo[2] + 1).to_s
      elsif self.board.cells[win_combo[0]] == opp_token && self.board.cells[win_combo[2]] == opp_token && self.board.cells[win_combo[1]] == " "
        return (win_combo[1] + 1).to_s
      elsif self.board.cells[win_combo[1]] == opp_token && self.board.cells[win_combo[2]] == opp_token && self.board.cells[win_combo[0]] == " "
        return (win_combo[0] + 1).to_s
      end
    end
  end

  def get_corners
    ["1", "3", "7", "9"].select do |corner|
      !self.board.taken?((corner))
    end
  end

  def get_first_spot_opened
    board.cells.each_with_index do |token, index|
      if token == " "
        return (index + 1).to_s
      end
    end
  end

  def opp_token
    self.token == "X" ? "O" : "X"
  end
end
end
