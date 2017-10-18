class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    9.times{|index| @cells[index] = " "}
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
    @cells.each do |cell|
      return false if cell == " "
    end
  end

  def turn_count
    total = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        total +=1
      end
    end
    total
  end

  def taken?(input)
    square = position(input)
    if square == "X" || square == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && taken?(input) == false
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end
end
