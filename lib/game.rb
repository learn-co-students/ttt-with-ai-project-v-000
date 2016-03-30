require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = nil, player_2 = nil, board = nil)
    game = self
    game.board = board
    #@board = Board.new
    #@player_1 = player_1
    game.player_1 = player_1
    #game.player_1 = Player.new("X")
    @player_2 = player_2
    #@player_2 = Player.new("O")
  end

  def current_player
    @board.turn_count.even?
      player_1
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.position_taken?(combination[0])
        if @board[combination[0]] == @board[combination[1]] && @board[combination[1]]== @board[combination[2]]
          return combination
        end
      end
    end
    false
  end

  def draw?
    board.full? && !Game.self.won?
  end

WIN_COMBINATIONS= [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6]
]

#binding.pry
end
