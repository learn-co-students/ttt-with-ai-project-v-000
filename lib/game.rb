class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1, player_2, board)
    @board = Board.new
    @player_1 = Player.new("X")
    @player_2 = Player.new("O")

  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal from top right
    [6,4,2] #Diagonal from top left
    ]

    def current_player(board)
      turn_count.even? ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.detect do |win_comb|
        if (win_comb.any? {|position| position_taken?(position)}) && (@board[win_comb[0]] == @board[win_comb[1]] && @board[win_comb[0]] == @board[win_comb[2]])
          win_comb
        end
      end
    end






end
