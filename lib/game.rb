require "pry"

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
    [6,4,2],
  ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if @board.turn_count % 2 == 0
        player_1
      else
        player_2
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
      end
    end

    def draw?
      @board.full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      won = won?
      if won? && @board.cells[won[0]] == "X"
        "X"
      elsif won? && @board.cells[won[0]] == "O"
        "O"
      end
    end

    def turn
      player = current_player
      move = player.move(@board)
      if @board.valid_move?(move) == false
        puts "Please enter a valid move"
        turn
      else
        @board.update(move, player)
      end
      @board.display
    end

    def play
      until over?
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
