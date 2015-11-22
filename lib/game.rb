require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board

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
      turn_counter = board.cells.count{|a| a != " "}
      if turn_counter % 2 == 0
        return @player_1
      else
        return @player_2 
      end
    end

    def over?
      draw? || won?
    end

    def won?
      cb = board.cells
      WIN_COMBINATIONS.each do |a|
        if (cb[a[0]] != " ") && (cb[a[0]] == cb[a[1]] && cb[a[0]] == cb[a[2]])
          @winner = cb[a[0]]
          return true
        end
      end
      return false
    end

    def draw?
      board.cells.count{|a| a != " "} == 9 && won? == false
    end

    def winner
      won?
      @winner
    end

    def turn
      board.display
      spot = current_player.move(board)
      if valid_move?(spot)
        board.cells[spot.to_i - 1] = current_player.token
      else
        puts "invalid entry"
        turn
      end

    end

    def valid_move?(spot)
      spot = spot.to_i - 1
      if position_taken?(spot) == false && spot.between?(0,8) == true
        true
      else
        false
      end
    end

    def position_taken?(spot)
      !(board.cells[spot].nil? || board.cells[spot] == " ")
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