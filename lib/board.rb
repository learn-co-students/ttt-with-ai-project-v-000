require "pry"
class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  #display_board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  # Helper Method
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    index = input_to_index(user_input)
    self.cells[index]
  end

  # Helper Method
  def full?
    self.cells.all? { |token| token == "X" || token == "O" }
   #!@board.include?(" ") || !@board.include?("") ||
  end

  # Helper Method
  def turn_count
    self.cells.count{ |token| token == "X" || token == "O" }
  end

  # Helper Method
  def taken?(user_input)
    #binding.pry
    index = input_to_index(user_input)
    !(self.cells[index].nil? || self.cells[index] == " ")
  end

  # Helper Method
  def valid_move?(user_input)
    index = input_to_index(user_input)
    #binding.pry
    index.between?(0, 8) && !taken?(user_input)
  end

  def update(user_input, current_player)
    valid_move?(user_input) ? move(user_input, current_player) : nil
    #binding.pry
  end

  # Helper Method
    def move(user_input, current_player)
      index = input_to_index(user_input)
      self.cells[index] = current_player.token
    end
end
