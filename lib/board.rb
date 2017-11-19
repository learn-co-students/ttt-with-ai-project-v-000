class Board
  attr_accessor :cells

  def initialize
    @cells = []
    9.times {@cells << " "}
  end

  def reset!
    @cells.clear
    9.times {@cells << " "}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "\n-----------\n"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "\n-----------\n"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(location)
    @cells[location.to_i-1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    9-@cells.count(" ")
  end

  def taken?(position)
    @cells[position.to_i-1]==" " ? false : true
  end

  def valid_move?(position)
    (1..9).include?(position.to_i) && !taken?(position) ? true : false
  end

  def update(position, player)
    if valid_move?(position)
      @cells[position.to_i - 1] = player.token #change to player later?
    end
  end
end
