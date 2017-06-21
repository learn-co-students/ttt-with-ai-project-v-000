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
  [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    board.full? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      winner_one = combo[0]
      winner_two = combo[1]
      winner_three = combo[2]
      position_1 = board.cells[winner_one]
      position_2 = board.cells[winner_two]
      position_3 = board.cells[winner_three]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        true
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        true
      else
        false
      end
    end
  end

  def draw?
    board.full? && !won? ? true : false
  end

  def winner
    if winning = won?
      @winner = @board.cells[winning.first]
    end
  end

  def turn
    player_turn = current_player
    player_move = player_turn.move(@board)
    if !@board.valid_move?(player_move)
      turn
    else
      @board.update(player_move, player_turn)
      @board.display
    end
  end

  def play
    while !over? && !draw?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end


end
