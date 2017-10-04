class Board

  attr_accessor :cells
  @@board = []

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts (" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} ")
    puts ("-----------")
    puts ((" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "))
    puts ("-----------")
    puts ((" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "))
  end

  def position(user_input)
    position = user_input.to_i - 1
    self.cells[position]
  end

  def full?
    self.cells.none? {|position| position == " "}
  end

  def turn_count
    occupied_spaces = self.cells.count {|position| position == "X" || position == "O"}
  end

  def taken?(user_input)
    position = user_input.to_i - 1
    self.cells[position] == "X" || self.cells[position] == "O"
  end

  def valid_move?(user_input)
    position = user_input.to_i - 1
    if self.cells[position] == " " && user_input.to_i > 0
      true
    else
      false
    end
  end

  def update(user_input, player)
    self.cells[user_input.to_i - 1] = player.token
  end




end
