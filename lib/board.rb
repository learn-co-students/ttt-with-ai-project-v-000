class Board

  attr_accessor :cells, :position

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
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
    index = input.to_i - 1
    self.cells[index]
  end

  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = player.token
  end

  def token
    turn_count.even? ? "X" : "O"
  end

  def full?
    self.cells.all? {|element| element == "X" || element == "O"}
  end

  def turn_count
    counter = 0
    self.cells.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    !(self.position(input).nil? || self.position(input) == " ")
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !self.taken?(input)
  end
end
