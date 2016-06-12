class Board
  attr_accessor :cells

  def initialize
    @cells = []
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

  def position(position)
    @cells[position.to_i - 1]
  end

  def full?
    if @cells.select{|i| i == " "} == []
      return true
    end
  end

  def turn_count
    @cells.count{|value| value == "X" || value == "O"}
  end

  def taken?(location)
    position = (location.to_i) - 1
    (cells[position] != " " && cells[position] != "" && cells[position] != nil)
  end

  def valid_move?(location)
    !taken?(location.to_i) && (location.to_i).between?(1, 9)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
