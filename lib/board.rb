class Board
  require 'pry'
  attr_accessor :cells, :board

  def initialize
    @board = Array.new(9, " ")
    @cells = @board
  end

  def reset!
    @board = Array.new(9, " ")
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell == "O" || cell == "X"}
  end

  def turn_count
    count = 0

    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(num)
    self.cells[num.to_i - 1].eql?("X") || self.cells[num.to_i - 1].eql?("O")
  end

  def valid_move?(num)
    !self.taken?(num) && true if num.to_i > 0 && num.to_i <= 9
  end

  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end

end