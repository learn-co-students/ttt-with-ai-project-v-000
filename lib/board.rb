class Board

  attr_accessor :cells

 def initialize
   reset!
 end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
   @cells.all? do |index|
   index == "X" || index == "O"
   end
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_imput)
   position(user_imput) == "X" || position(user_imput) == "O"
  end

  def valid_move?(user_input)
    user_input = user_input.to_i
    user_input.between?(1,9) && !taken?(user_input)
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

end
