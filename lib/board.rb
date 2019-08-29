class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full?
    self.cells.all? do |cell|
      cell == "X" || cell == "O"
    end
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    self.cells[user_input.to_i - 1] == "X" || self.cells[user_input.to_i - 1] == "O"
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(user_input, player)
    self.cells[user_input.to_i - 1] = player.token
  end
end
