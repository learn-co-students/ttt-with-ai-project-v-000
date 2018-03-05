require 'pry'

class Board

  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    cells[index]
  end

  def full?
    self.cells.none? {|cell| cell == " "}
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O" then true else false
    end
  end

  def valid_move?(user_input)
    if user_input.to_i.between?(1,9) && !taken?(user_input) then true else false
    end
  end

  def update(user_input, player)
    if valid_move?(user_input)
      self.cells[user_input.to_i - 1] = player.token
    end
    display
  end

end
