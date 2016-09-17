require "pry"

class Game
  attr_accessor :board, :player_1, :player_2, :winner

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal from top right
    [6,4,2]  #Diagonal from top left
    ]

    # @winning_combo = []

    def current_player
      board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0] + 1) == board.position(combo[1] + 1) &&
        board.position(combo[1] + 1) == board.position(combo[2] + 1) &&
        board.taken?(combo[0] + 1)
      end
    end


    # def won?
    #   WIN_COMBINATIONS.any? do |win_comb|
    #     board.position(win_comb[0]) == board.position(win_comb[1]) &&
    #     board.position(win_comb[0]) == board.position(win_comb[2]) &&
    #     board.taken?(win_comb[0])
    #   end
    # end

    def over?
      won? || draw?
    end

    def draw?
      board.full? && !won?
    end

    def winner
          if won?
            @board.cells[won?[0]]
          end
    #   if won? && @board.cells.count("X") > @board.cells.count("O")
    #     return "X"
    #   elsif won? && @board.cells.count("X") < @board.cells.count("O")
    #     return "O"
    #   else
    #     return "No winner"
    #   end
      # winning_combo
    end

end
