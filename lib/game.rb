require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  # include Players::Human

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

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count % 2 == 0
        self.player_1
      else
        self.player_2
      end
    end

    def over?
      self.board.cells.all?{|positions| positions == "X" || positions == "O"}
    end

    def won?
      WIN_COMBINATIONS.find do |win_combination|
        if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X"
          true
        elsif self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
          true
        else
          false
        end
      end
    end

    def draw?
      if over? && !won?
        true
      else won?
        false
      end
    end

    def winner
      if won?
        self.board.cells[won?[0]]
      else
        nil
      end
    end

    def turn
      # binding.pry

    end

    # 1) Game turn makes valid moves
    #  Failure/Error: expect(game.player_1).to receive(:gets).and_return("1")
    #    (#<Players::Human:0x00000001cab9c0>).gets(*(any args))
    #        expected: 1 time with any arguments
    #        received: 0 times with any arguments
    #  # ./spec/04_game_spec.rb:168:in `block (3 levels) in <top (required)>'

end
