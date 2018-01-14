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

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  @board.turn_count.even? ? @player_1 : @player_2
  # it takes the board class' turn_count method
  # is the same as saying is the turn even?
  # ? means 'then'
  # if its true then it is player_1
  # : means else
  # if it is even, then it is player_1 else player_2
end

def over?
  draw? || won?
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board.cells[combo[0]] == @board.cells[combo[1]] &&
    @board.cells[combo[1]] == @board.cells[combo[2]] &&
    @board.cells[combo[0]] != " "

  end
end

def draw?
 board.full? && !won?
end


  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end


  def turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      # binding.pry
      @board.update(input, player)
      @board.display
    else
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
