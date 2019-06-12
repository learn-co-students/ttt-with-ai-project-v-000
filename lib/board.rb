class Board 
  
  attr_accessor :cells, :token
  def initialize
    @cells = Array.new(9, " ") 
  end 
  
  def reset!
    @cells.clear 
    @cells = Array.new(9, " ") 
  end 
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    the_position = input.to_i - 1 
    spot = @cells[the_position]
    spot 
  end 
  
  def full?
    @cells.all? do |spot|
      spot == "X" || spot == "O"
    end 
  end
  
  def turn_count 
    counter = 0 
    @cells.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1 
      end 
    end 
    counter 
  end 
  
  def taken?(value)
    if position(value) == "X" || position(value) == "O"
      true 
    elsif position(value) == " " || position(value) == nil 
      false
    end 
  end 
  
  def valid_move?(input)
    if input.to_i.between?(1, 9) && !taken?(input)
      true 
    else 
      false 
    end 
  end 
  
  def update(spot, player)
    input = spot.to_i - 1
    @cells[input] = player.token
    player
  end 
  
end 