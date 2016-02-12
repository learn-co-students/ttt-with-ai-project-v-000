require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]

  def initialize(player_1=Human.new('X'), player_2=Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]]
    end
  end

  def draw?
    over? && !won? 
  end

  def winner
    if won? && board.cells[won?[0]] == player_1.token
      player_1.token
    elsif won? && board.cells[won?[0]] == player_2.token
      player_2.token
    end
  end

  def turn
    puts "Please select a position 1-9:"
    input = gets.chomp
    if board.valid_move?(input)
      board.turn
  end

end
