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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board.cells[win_combination[0]]
      position_2 = board.cells[win_combination[1]]
      position_3 = board.cells[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def draw?
    board.full? && self.won? == false
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if won? != false
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = self.current_player
    players_move = player.move(self.board)
    if board.valid_move?(players_move)
      board.update(players_move, player)
      players_move
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
