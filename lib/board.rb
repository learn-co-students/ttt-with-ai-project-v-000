class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts "\n\n"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "\n\n"
  end

  def position(cell_num)
    cells[cell_num.to_i-1]
  end

  def full?
    cells.all? {|position| position != " "}
  end

  def turn_count
    cells.count {|i| i != " "}
  end

  def taken?(cell_num)
    num = cell_num.to_i-1
    cells[num] != " "
  end

  def valid_move?(cell_num)
    num = cell_num.to_i-1
    num >= 0 && num <= 8 && !taken?(cell_num)
  end

  def update(cell_num, player)
    num = cell_num.to_i-1
    cells[num] = player.token if valid_move?(cell_num)
  end

end