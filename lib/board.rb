class Board
  attr_accessor :cells, :board, :x, :o

  def initialize
    @board = board
    @cells = Array.new(9, " ")
    @x = []
    @o = []
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def position(input)
    cells[input.to_i - 1]
  end

  def update(input, player)
    case player.token
      when "X"
        x << input.to_i
      when "O"
        o << input.to_i
      end
    cells[input.to_i - 1] = player.token
  end

  def full?
    cells.none? {|x| x == " "}
  end

  def turn_count
    cells.count {|x| x != " "}
  end

  def taken?(spot)
    position(spot) == nil || position(spot) == " " ? false : true
  end

  def valid_move?(spot)
    !taken?(spot) && spot.to_i.between?(1,9) ? true : false
  end

end
