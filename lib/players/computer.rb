class Player::Computer < Player
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], # across
    [0,3,6], [1,4,7], [2,5,8], # down
    [0,4,8], [2,4,6]           # diagonal
  ]

  def move(board)
    @board = board
    return win_move if win_move != nil
    return block_move if block_move != nil
    return corner_or_mid_move if corner_or_mid_move != nil
    empty_cells.fetch(rand(1..empty_cells.length) - 1).to_s
  end

  def empty_cells
    empties = []
    @board.cells.each_index { |i|
      empties << i+1 if @board.taken?(i+1) == false
      #binding.pry
    }
    empties
  end

  def win_move
    WIN_COMBINATIONS.each do |combo|
      tokens = [@board.cells[combo[0]], @board.cells[combo[1]], @board.cells[combo[2]]]
      if tokens.count(@token) == 2
        combo.each {|cell_index|
          #binding.pry
          return (cell_index + 1).to_s if @board.taken?(cell_index + 1) == false
        }
      end
    end
    nil
  end

  def block_move
    foe_token= @token=="X" ? "O" : "X"
    #binding.pry
    WIN_COMBINATIONS.each do |combo|
      tokens = [@board.cells[combo[0]], @board.cells[combo[1]], @board.cells[combo[2]]]
      if tokens.count(foe_token) == 2
        combo.each {|cell_index|
          #binding.pry
          return (cell_index + 1).to_s if @board.taken?(cell_index + 1) == false
        }
      end
    end
    nil
  end

  def corner_or_mid_move
    corners = ["1","3","5","7","9"].delete_if {|corner|
      @board.taken?(corner)
    }
    return nil if corners == []
    corners.fetch(rand(1..corners.length) - 1)
  end
end
