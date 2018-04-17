class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9,' ')
  end

  def reset!
    # Following line is valid but won't pass test.  Test is letting
    # board be reset to single element array.  In reality, Board should
    # not have writer method for cells (to ensure the integrity)
    ##@cells.map! { |e| " "}
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position (index)
    @cells[index.to_i-1]
  end

  def full?
    @cells.all? { | c | c!=" "}
  end

  def turn_count
    @cells.count {|c| c!=" "}
  end

  def taken? (position)
    @cells[position.to_i-1]!=" "
  end

  def valid_move? (position)
    !taken?(position) && position.to_i.between?(1,9)
  end

  def update (position, player)
    @cells[position.to_i-1]=player.token if valid_move?(position)
  end
end
