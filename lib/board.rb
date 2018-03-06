class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position (input)
    position = input.to_i - 1
    @cells[position]
  end
  
  def full?
    if turn_count != 9 #@cells.any? { |string| string == " " }
      false
    else
      true
    end
  end
  
  def turn_count
    @cells.count { |position| position == "X" || position == "O" }
  end
  
  def taken?(input)
    position = input.to_i - 1
    if @cells[position] == "X" || @cells[position] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    if input.to_i == 0
      false
    else
      !taken?(input)
    end
  end
  
  def update(input, player)
    position = input.to_i - 1
    @cells[position] = player.token
  end
end