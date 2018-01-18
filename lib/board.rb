class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(player_move)
    idx = player_move.to_i - 1
    cells[idx]
  end

  def full?
    cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    counter = 0
      cells.each do |play| 
        counter += 1 if play == "X" || play == "O"
      end
      counter
  end

  def taken?(player_move)
    cell_idx = player_move.to_i - 1
    cells[cell_idx] == "O" || cells[cell_idx] == "X"
  end

  def valid_move?(player_move)
    cell_idx = player_move.to_i - 1  
    cell_idx.between?(0,8) && !(taken?(player_move))
  end

  def update(player_move, player)
    cell_idx = player_move.to_i - 1
    cells[cell_idx] = player.token if self.valid_move?(player_move)
  end

end















