class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def update(pos, player)
    cells[pos.to_i - 1] = player.token
  end

  def full?
   cells.detect {|cell| cell == " " || cell == nil} ? false : true
  end

  def turn_count
    if cells.select {|cell| cell == "O" || cell == "X"}
      return cells.select {|cell| cell == "O" || cell == "X"}.count
    else
      return 0
    end
  end

  def taken?(pos)
    position(pos) != " " && position(pos) != nil ? true : false
  end

  def valid_move?(pos)
    if (1..9).include?(pos.to_i) && taken?(pos) == false
      return true
    else 
      false
    end
  end


end