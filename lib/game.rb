require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @count = board.turn_count
    if @count % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]]=="X"&&@board.cells[combo[1]]=="X"&&@board.cells[combo[2]]=="X"
      return combo
    elsif @board.cells[combo[0]]=="O"&&@board.cells[combo[1]]=="O"&&@board.cells[combo[2]]=="O"
      return combo
    end
  end
    return false
  end

  def draw?
    board.full? == true && won? == false
  end

  def winner
    if !!won?
      board.cells[won?[0]]
    else
      nil
    end
  end

  def over?
    if !!won? == true || draw? == true
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter a number between 1-9"
    input = gets.strip.to_i
    #binding.pry
  end

end
