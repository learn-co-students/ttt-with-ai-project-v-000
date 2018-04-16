require 'pry'
class Board
  # Is this saving

  attr_accessor :cells

  def initialize(cells = Array.new(9," "))
    @cells = cells
    self.reset!
  end

  def reset!
    @cells.clear
    @cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    cells.all?{|cell| cell != " "}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
     user_input.to_i.between?(1,9) if !taken?(user_input)
  end

  def update(user_input,player)
    cells[user_input.to_i-1] = player.token
  end


end
