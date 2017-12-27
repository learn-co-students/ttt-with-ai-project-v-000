require "pry"
class Board

  attr_accessor :cells, :board, :token

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.reset!
  end

  def self.cells
    board = []
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    user_input = input.to_i - 1
    self.cells[user_input]
  end

  def full?
    cells.all? {|i| i=="X" || i=="O"}
  end

  def turn_count
    spaces_taken = 0
    self.cells.each do |space|
      if space == "X" || space == "O"
        spaces_taken += 1
      end
    end
    spaces_taken
  end

  def taken?(input)
    if self.cells[input.to_i-1] == "X" || self.cells[input.to_i-1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) &&
    !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end

end
