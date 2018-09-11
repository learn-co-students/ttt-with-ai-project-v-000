class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9) {String.new(" ")}
  end

  def reset!
    self.cells.clear
    @cells = Array.new(9) {String.new(" ")}
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select {|v| v != " "}.length
  end

  def taken?(input)
    self.position(input).eql?("X") || self.position(input).eql?("O")
  end

  def valid_move?(input)
    !self.taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player)
    @cells[input.to_i - 1]= player.token
  end

end
