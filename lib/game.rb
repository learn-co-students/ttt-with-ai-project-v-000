require 'pry'


  WIN_COMBINATIONS =
  [[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [2, 5, 8],
  [1, 4, 7],
  [0, 4, 8],
  [2, 4, 6]]

class Game
    attr_accessor :board, :player_1, :player_2, :token
    include Players

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
      @board.display
    end

    def current_player
      if @board.turn_count.odd?
        @player_2
      else
        @player_1
      end
    end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.detect do |combination|

          if board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] != " "
            return combination
          else
            false
          end
        end
      end

    def draw?
      !won? && board.full?
    end

    def winner
        if won?
          winning_combo = self.won?
          winner = self.board.cells[winning_combo[0]]
          winner
        else
          nil
        end
    end

    def turn
        move = current_player.move(@board)
        if @board.valid_move?(move)
          board.update(move, current_player)
          board.display
        else
          turn
        end
    end

    def play
      until over?
        turn
      end
      if won?
          puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
