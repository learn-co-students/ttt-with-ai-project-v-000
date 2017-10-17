require "pry"

class Game

  WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else @board.turn_count % 2 == 1
      @player_2
    end
  end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        if board.cells[win_combination[0]] == "X" && board.cells[win_combination[1]] == "X" && board.cells[win_combination[2]] == "X"
          return win_combination
        elsif board.cells[win_combination[0]] == "O" && board.cells[win_combination[1]] == "O" && board.cells[win_combination[2]] == "O"
          return win_combination
        end
      end
      false
    end

    def draw?
      if won? == false && board.full?
        return true
      else
        false
      end
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

    def turn
      player = current_player.move(board)
      #if  move is valid, make move, changes to player 2
      if board.valid_move?(player)
        board.update(player, current_player)
        board.display
      #if move is invalid
      #human move method asks for the users input and returns it
    else board.valid_move?(player) == false
      #puts "invalid" and asks for input again
      puts "Nice try, but try again"
      turn
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
