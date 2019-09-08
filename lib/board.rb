class Board
  
  attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def initialize()
    reset!
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input) #returns the value of the board cell based on player input
    cells[input.to_i - 1]
  end
  
  def full?
    cells.none? do |token| #none? returns true if the block returns false for all of cells
      token == " " || token.nil?
    end
  end
  
  def turn_count
    counter = 0
    cells.each do |index|
      if index != " "
        counter += 1
      end
    end
    counter
  end
  
  def taken?(input)
    (position(input) == "X" || position(input) == "O")
  end
  
  def valid_move?(input)
    (input.to_i.between?(1,9) && !taken?(input))
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end