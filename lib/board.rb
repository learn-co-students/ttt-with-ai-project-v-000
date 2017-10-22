class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
      cells.all?{|token| token == "X" || token == "O" }
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    cells[index.to_i-1] == "X" || cells[index.to_i-1] == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    if(valid_move?(index))
      cells[index.to_i - 1] = player.token
    end
  end

end
