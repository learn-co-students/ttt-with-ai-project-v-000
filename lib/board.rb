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
  
  def reset!
    @cells = Array.new(9, " ")
  end

  def position(input)
    input = input.to_i - 1  
    @cells[input]
  end

  def update(location, current_player)
    @cells[location.to_i-1] = current_player.token
  end

  def taken?(location)
    location = location.to_i
  !(@cells[location -1].nil? || @cells[location-1] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position.to_i)
  end

  def full?
    if @cells.all? { |cell| cell == "X" || cell == "O"}
      true
    else
      false
    end
  end

   def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

end