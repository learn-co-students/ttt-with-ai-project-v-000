class Board

  attr_accessor :cells
  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i - 1
    @cells[input]
  end

  def full?
   @cells.all?{|square| square != " " }
  end

  def turn_count
    @cells.count{|square| square != " " }
  end

  def taken?(input)
    input = input.to_i - 1
    @cells[input] != " "
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input,player)
    input = input.to_i - 1
    @cells[input] = player.token
  end

  def reset!
    @cells = (Array.new(9, " ")) #[" "," "," "," "," "," "," "," "," "]
  end
end
