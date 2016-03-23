class Board
  attr_accessor :cells

  def initialize()
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

  def position(input)
    return false if (input.to_i <= 0 || input.to_i > 9)
    @cells[input.to_i - 1]
  end

  def full? 
    @cells.any? {|cell| cell == " "} ? false : true
  end

  def turn_count
    #number of turns that have been taken based on cell count
    @cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end
  
  def taken?(input)
    contents = self.position(input) 
    contents == "X" or contents == "O"
  end

  def valid_move?(input)
    #return false if input is not in range of the board, or if position is taken
    self.position(input) && !self.taken?(input)
  end

  def is_enemy?(position, player)
    square = self.cells[position]
    !square.strip.empty? && square != player.token
  end

  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token 
    end
  end
end

