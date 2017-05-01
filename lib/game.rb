require "pry"
class Game
  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  attr_accessor :board, :player_1, :player_2
  def initialize (player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board= Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def self.create (player_1, player_2)
    new_game = Game.new(player_1,player_2)
    new_game.board.display
    new_game.play
  end
  def current_player
    self.board.turn_count.even?? player_1 : player_2
  end
  def over?
    draw? || won?
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all?{|index| board.cells[index]=="X"} ||
      win_combo.all?{|index| board.cells[index]=="O"}
    end
  end
  def draw?
    board.full? && !won?
  end
  def winner
    won= won?
    board.cells[won.first] if won
  end
  def turn
    user_input = current_player.move(board)
    while !board.valid_move?(user_input)
      user_input = current_player.move(board)
    end
    board.update(user_input, current_player)
  end
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat\'s Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
