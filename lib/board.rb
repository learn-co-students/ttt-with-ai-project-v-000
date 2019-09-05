class Board
  attr_accessor :cells
  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
  end

  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def reset!
    self.cells = Array.new(9, " ")
  end

  def position(index)
    self.cells[index.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.select{|c| !c.lstrip.empty?}.count
  end

  def taken?(input)
    index = (input.to_i)-1
    self.cells[index] == " " ? false : true
  end

  def valid_move?(input)
    !taken?(input) && (1..9).member?(input.to_i)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end


end
