class Board
  attr_accessor :cells


  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def position(input)
    input = input.to_i
   @cells[input - 1]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  #to display before the start of the game, making it user-friendly
  def display_intro
    puts " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "
  end

  def full?
    !@cells.any?{|x| x == " " || x == "" }
  end

  def turn_count
    x = @cells.count("X")
    o = @cells.count("O")
    x + o 
  end

  def taken?(position)
    position = position.to_i
    position-=1
    !(@cells[position].nil? || @cells[position] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    !self.taken?(position) && position.between?(1,9)
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

end