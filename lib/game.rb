require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #diagonal win
    [6,4,2], #diagonal win
    [0,3,6], #row 1 win
    [1,4,7], #row 2 win
    [2,5,8], #row 3 win
    ]

    def initialize(player_1= Players::Human.new, player_2= Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if @board.turn_count.even?
           player_1
        else
           player_2
      end
    end

    def over?
      if @board.full? || won? || draw?
          true
        else false
      end
    end

    def draw?
      if @board.full? && !won?
        true 
      end
      #if all nine position have been taken then it is a draw. 
    end

    def won?
         WIN_COMBINATIONS.detect { |win_combination|
          @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
          @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
          @board.taken?(win_combination[0]+1)} 
    end

    def winner
      win_array = won?
      if win_array == won? && won? != nil
          return @board.cells[win_array[0]]
        else nil
      end
    end

    def turn

      player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{board.turn_count+1}\n" 
        @board.display
        @board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        @board.display
        puts "\n"
      end
    end

    def play
      while !over? 
       turn
      end
      if won? 
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end
end
