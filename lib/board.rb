class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    # self.cells.each do |cell|
    #   if cell == " "
    #     return false
    #   end
    # end
    # return true
    self.cells.all? { |cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    position(position) == "X" || position(position) == "O"
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if (cell == "X" || cell == "O")
        counter += 1
      end
    end
    counter
  end

  def valid_move?(move)
    move = move.to_i
    if (move > 0 && 10 > move)
      if self.cells[move-1] == " "
        return true
      end
    end
    false
  end

  def update(move, player)
    if (valid_move?(move) && !taken?(move))
      move = move.to_i
      self.cells[move-1] = player.token
    end
  end

end
