require 'pry'
class Board

  attr_accessor :cells, :last_move

  def initialize
    @cells = reset!
    @last_move = nil
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "

  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell == "O" || cell == "X"}
  end

  def turn_count
    @cells.count {|token| token =="O" || token == "X"}
  end

  def taken?(user_input)
    position(user_input) == "O" || position(user_input) == "X"

  end

  def valid_move?(user_input)
    user_input.to_i > 0 && user_input.to_i < 10 && !taken?(user_input)
  end

  def update(user_input, player)
    if valid_move?(user_input)
      @cells[user_input.to_i - 1] = player.token
    end
  end

end
