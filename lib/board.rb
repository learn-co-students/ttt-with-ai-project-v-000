class Board

  attr_accessor :cells, :token

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
puts "------------"
puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
puts "------------"
puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    value = input.to_i - 1
    return @cells[value]
  end

  def full?
    array = @cells.each do |cell|
      cell == " "
    end
    if array.include?(" ") then false else true end
  end

  def turn_count
    array = @cells.reject {|c| c == " "}
    return array.length
  end

  def taken?(position)
    if (@cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O") == true then true else false end
  end

  def valid_move?(position)
    if position.to_i > 0 && taken?(position) == false then true else false end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
    display
  end

end
