class Board
  attr_accessor :cells
  
  def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    pos = input.to_i
    cells[pos - 1]
  end
  
  def update(input, player)
    pos = input.to_i - 1
    cells[pos] = player.token
  end
  
  def taken?(input)
    if position(input) != " "
      true
    else
      false
    end
  end
  
  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def turn_count
    count = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end
  
  def valid_move?(input)
    num = input.to_i
    if taken?(input) == false && (num >= 1 && num <= 9)
      true
    else
      false
    end
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
end