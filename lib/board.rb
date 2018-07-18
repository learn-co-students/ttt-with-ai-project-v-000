class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
    #cells = []
    #9.times do |i|
    #  cells[i] = " "
    #end
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def reset!
    9.times do |i|
      cells[i] = " "
    end    
  end
    
  def position(input)
    number = input.to_i
    number-=1
    @cells[number]
  end
  
  def full?
    !cells.detect { |x| x == " " } #if detect doesn't find any " " then it returns true
  end
  
  def turn_count
    cells.count {|token| token == "X" || token == "O"}
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end
  
  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !taken?(input) ? true : false
  end
  
  def update(input, player)
    #updates the cells in the board with the player token according to the input
    if valid_move?(input) == true
      number = input.to_i - 1
      cells[number] = player.token
    end
  end
    
end