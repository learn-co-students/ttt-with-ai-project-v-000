require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [ ]
    self.reset!
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def cells
    @cells
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def full?
    self.cells.all? do |board_index|
      board_index == "X" || board_index == "O"
    end
  end

  def turn_count
    counter = 0
    self.cells.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    index  =  self.input_to_index(user_input)
    if self.cells[index] == " " || self.cells[index] == "" || self.cells[index] == nil
      return false
    elsif self.cells[index] == "X" || self.cells[index] == "O"
      return true
    end

  end

  def position(user_input) #takes in users input, looks up value of cell at index
      index = self.input_to_index(user_input)
      self.cells[index]
  end

  def update(user_input, object)
    index = self.input_to_index(user_input)
    self.cells[index] = object.token
  end

  def valid_move?(user_input)
      index = self.input_to_index(user_input)
    if index.between?(0,8) == true && self.taken?(user_input) == false
    return true
    # # else
    # #   return false
    end
  end

    def input_to_index(user_input)
        index = user_input.to_i - 1
    end

end
