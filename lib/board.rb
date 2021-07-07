require "pry"

class Board
  attr_accessor :cells
  attr_reader :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display

   board = @cells

    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    !self.cells.any? {|x|
      x == " "}
  end

  def turn_count
    a = []
    self.cells.each do |x|
       unless x == " "
        a << x
      end
    end
      a.count
  end

  def taken?(position)
    self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
  end

  def valid_move?(position)
    if position.to_i.between?(1,9)
      !self.taken?(position)
    else
      position.to_i.between?(1,9)
    end
  end

  def update(position, token)
    if self.turn_count.odd?
      player = "O"
    elsif self.turn_count.even?
      player = "X"
    else
      player = " "
    end
    self.cells[position.to_i - 1] = player
  end

end
