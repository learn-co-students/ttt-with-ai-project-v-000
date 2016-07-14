require "pry"

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.cells.count("O") < @board.cells.count("X") ? player_2 : player_1
  end

  def over?
    true if draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return true
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true
      end
    end
    return false
  end

  def draw?
    true if board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
    return nil
  end

  def turn
    position = current_player.take_turn
    turn if !board.valid_move?(position)
    board.update(position, current_player)
  end
    
  def play
    turn until over?
    puts "Congratulations X!" if won? && winner == "X"
    puts "Congratulations O!" if won? && winner == "O"
    puts "Cats Game!" if draw?
  end

end





