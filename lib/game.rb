require 'pry'
#require 'lib/layer.rb'

class Game
    attr_accessor :board, :player_1, :player_2, :cells, :token, :player

    def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"),board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
      @player = player
    end

     WIN_COMBINATIONS = [
              [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8],
              [0, 4, 8],
              [6, 4, 2]
             ]


#   describe '#current_player' do
#     it 'returns the correct player, X, for the third move' do
#       game = Game.new
#       game.board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", " "]

#       expect(game.current_player.token).to eq("X")
#     end
#   end

   def turn_count
    self.board.cells.count { |position| position != " " }
  end

  def current_player
    self.token = turn_count.even? ? "X" : "O"
  end

  def over?
    !self.board.cells.include?(" ")
  end

end
# game = Game.new
 