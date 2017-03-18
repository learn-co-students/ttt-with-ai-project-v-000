class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n| #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} |\t\t| 1 | 2 | 3 |"
    puts "-------------\t\t-------------"
    puts "| #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} |\t\t| 4 | 5 | 6 |"
    puts "-------------\t\t-------------"
    puts "| #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} |\t\t| 7 | 8 | 9 |\n\n"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position(input)
    self.cells[input_to_index(input)]
  end

  def full?
    self.cells.none?{|cell| cell == " "}
  end

  def turn_count
    self.cells.select{|cell| cell != " "}.size
  end

  def taken?(input)
    self.position(input) != " "
  end

  def open?(input)
    self.position(input) == " "
  end

  def valid_move?(input)
    if input.to_i > 0 && input.to_i < 10
      taken?(input) == false ? true : false
    else
      false
    end
  end

  def update(input, player)
    self.cells[input_to_index(input)] = player.token if self.valid_move?(input)
  end

end
