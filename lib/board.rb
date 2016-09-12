class Board
  attr_accessor :cells

  def initialize
    @cells = board_array
  end

  def reset!
    @cells = board_array
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def update(position, player)
    if valid_move?(position)
      @cells[position.to_i - 1] = player.token
    end
  end

  def position(x)
    @cells[x.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    position(position) != " "
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1,9)
  end

  def turn_count
    1 + @cells.count {|cell| cell == "X" || cell == "0"}
  end

  private
  def board_array
    [" "," "," "," "," "," "," "," "," "]
  end

end

