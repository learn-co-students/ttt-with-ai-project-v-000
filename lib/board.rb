require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    game_board = @cells.map{|c| " #{c} "}
    puts game_board[0, 3].join("|")
    puts "-----------"
    puts game_board[3, 3].join("|")
    puts "-----------"
    puts game_board[6, 3].join("|")
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|c| c == "X" || c == "O"}
  end

  def turn_count
    @cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(input)
    cell = position(input)
    cell == "X" || cell == "O" ? true : false
  end

  def valid_move?(input)
    i = input.to_i
    i <= 9 && i > 0 && !taken?(input)
  end

  def update(input, player)
    i = input.to_i - 1
    token = player.token
    @cells[i] = token
  end

end