require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Player::Human.new('X'), player_2 = Player::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    if board.full?
      true
    elsif won?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.any? { |combo| board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != ' ' } 
  end

  def draw?
    true if won? == false && board.full?
  end

  def winner
    board.cells[WIN_COMBINATIONS.find { |combo| board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != ' ' }.first] if won?
  end

  def turn
    position = current_player.move(board) until board.valid_move?(position)
    board.update(position, current_player)
  end

  def play
    until over? || won? || draw?
      board.display
      turn
    end
    board.display
    puts "Congratulations #{winner}!" if won?
    puts 'Cats Game!' if draw?
  end

end
