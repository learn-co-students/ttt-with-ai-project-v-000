class Board
  attr_accessor :cells

  # Initialize #

  def initialize
    reset!
  end

  # Instance Methods #

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

   def full?
     !@cells.include?(" ")
   end

  def turn_count
   count = 0
   @cells.each do |token|
     count += 1 if token === 'X' || token === 'O'
   end
   count
  end

  def taken?(input)
    position(input) != " " ? true : false
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end


end
