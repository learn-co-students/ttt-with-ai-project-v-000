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

    def board
      @board
    end

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count%2 == 0 ? @player_1 : @player_2
    end

    def full?
      self.board.cells.any? {|i| i == " "} ? false : true
   end

    def draw?
      full? && !won?
    end

    def over?
      draw? || won?
    end

    def won?
    WIN_COMBINATIONS.detect do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == @player_1 && position_2 == @player_1 && position_3 ==  @player_1
          return win_combination
        elsif position_1 == @player_2 && position_2 == @player_2 && position_3 == @player_2
          win_combination
        else
          false
        end
      end
    end


end
