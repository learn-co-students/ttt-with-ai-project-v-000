require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
          [0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [2,5,8],
          [1,4,7],
          [0,4,8],
          [2,4,6]
        ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board #variable for board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if @board.turn_count.even?
        return player_1
      else
        return player_2
    end
  end

  def won?
      WIN_COMBINATIONS.each do |win|

        test = [
        @board.cells[win[0]],
        @board.cells[win[1]],
        @board.cells[win[2]]
        ]

        if test == ["X", "X", "X"] || test == ["O", "O", "O"]
          return win
      end
    end
    false
  end

  def draw?
      if @board.full? == true && won? == false
        return true
      else
        false
      end
   end


  def over?
    if draw? || won?
      return true
      end
    end

  def winner
    WIN_COMBINATIONS.each do |win|
      test = [
      @board.cells[win[0]],
      @board.cells[win[1]],
      @board.cells[win[2]]
      ]

      if test == ["X", "X", "X"]
        return "X"
      elsif test == ["O", "O", "O"]
        return "O"
      end
    end
      nil
  end

  def turn
    board.display

      plays = current_player

      # binding.pry

      play_move = plays.move(board)

      if @board.valid_move?(play_move) == false
        turn
      else
        @board.update(play_move, plays)

      end

  end

  def play

    while !over?
      turn
    end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end



end
