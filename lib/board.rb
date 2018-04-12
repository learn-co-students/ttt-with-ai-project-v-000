class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
    cells
  end

  def display
    puts rows = [" #{cells[0]} | #{cells[1]} | #{cells[2]} " , "-----------", " #{cells[3]} | #{cells[4]} | #{cells[5]} " , "-----------", " #{cells[6]} | #{cells[7]} | #{cells[8]} "]
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.none? { |cell| cell == " "}
  end

  def turn_count
    turn_count = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
      turn_count += 1
      end
    end
    turn_count
  end

  def taken?(input)
    if cells[input.to_i-1] != " "
       true
     else
       false
    end
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
      cells[input.to_i-1] = player.token
      display
  end

end
