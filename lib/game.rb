require 'pry'
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

    def initialize(p1=Players::Human.new("X"),      p2=Players::Human.new("O"), b=Board.new)
      @player_1 = p1
      @player_2 = p2
      @board = b
    end

    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |w|
        @board.cells[w[0]] == @board.cells[w[1]] && @board.cells[w[1]] == @board.cells[w[2]] && @board.taken?(w[0] + 1)
      end
    end

    def winner
      if won?
        wins = WIN_COMBINATIONS.detect do |w|
          @board.cells[w[0]] == @board.cells[w[1]] && @board.cells[w[1]] == @board.cells[w[2]] && @board.taken?(w[0] + 1)
        end
        return @board.cells[wins[0]]
      end
    end

    def full?
      @board.cells.all?{|spot| spot == "X" || spot == "O"}
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || full?
    end

    def turn
      loop do
        i = current_player.move(@board)
        if @board.valid_move?(i)
          board.update(i,current_player)
          board.display
          break
        end
      end
    end

    def play
      until over? || draw? do
        turn
      end
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end

end
