#token repesents the appropriate token for each player object

class Board
  require 'pry'
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def board
    @cells
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts
  end

  def position(input)
    board[input.to_i - 1]
  end

  def full?
    !board.any? {|x| x == " "}
  end

  def turn_count
    count = 0
    board.each {|position| position == "X" || position == "O" ? count += 1 : nil}
    count
  end

  def taken?(location)
    !(board[location.to_i-1].nil? || board[location.to_i-1] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    
    if (position.between?(1, 9) && !taken?(position))
      return true
    end
    return false
  end

  def update(input,player)
    board[input.strip.to_i - 1] = player.token
  end

end # => Board Class