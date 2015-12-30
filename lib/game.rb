require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board, :winner

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

    def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
      @winner = nil
    end

    def current_player

      if board.cells.count{|a| a != " "} % 2 == 0
        @player_1
      else
        @player_2 
      end
    end

    def over?
      draw? || won?
    end

    def won?
      # haven't figured out how to make #[] work yet
      # winner returning token resolves as false, could reassign to winning player object, but
      # that needs many other follow up fixes in related methods, worth?
      WIN_COMBINATIONS.each do |a|
        if (board.cells[a[0]] != " ") && 
            (board.cells[a[0]] == board.cells[a[1]] && 
            board.cells[a[0]] == board.cells[a[2]])

          @winner = board.cells[a[0]]
          return true
        end
      end
      return false
      #binding.pry
      #@winner
    end

    def draw?
      board.full?
    end

    def winner
      won?
      @winner
    end

    def turn
      board.display
      spot = current_player.move(board)
      if board.valid_move?(spot)
        board.update(spot, self.current_player)
      else
        puts "invalid entry"
        turn
      end

    end

    def play
      while over? != true
        turn
      end
      if won?
        board.display
        puts "Congratulations #{@winner}!"
      elsif draw?
        board.display
       puts "Cats Game!"
      end
    end

end