
class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
            ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

      @player_1 = player_1
      @player_2 = player_2
      @board = board

    end

    def turn_count
      counter = 0
      self.board.cells.each do |current_turn|
        if current_turn == "X" || current_turn == "O"
          counter += 1
        end
      end
      counter
    end

    def current_player
      # binding.pry
      self.turn_count
      if self.turn_count % 2 == 0
        self.player_1.token
      else
        self.player_2.token
      end
    end



end
