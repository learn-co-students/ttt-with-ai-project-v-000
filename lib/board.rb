class Board
  attr_accessor :cells
  attr_reader :move_history
  
  
  def initialize
    reset!
    @move_history = []
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
  
  def divider
    puts " "
    puts "************************"
    puts " "
  end
  
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  
  def full?
    self.cells.none? { |cell| cell == " " }
  end
  
  def turn_count
    used_cells = self.cells.select { |cell| cell == "X" || cell == "O" }
    used_cells.length
  end
  
  def taken?(input)
    cell = position(input)
    cell == "X" || cell == "O" ? true : false
  end
  
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
  
  def update(input, player)
    self.cells[input.to_i - 1] = player.token
    @move_history << (input.to_i - 1)
  end
  
end