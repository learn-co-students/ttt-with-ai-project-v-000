require './lib/player.rb'

class Game
   Players::Human
  include Players
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    if @board.turn_count.even? == true then player_1 else player_2
    end
  end

  def over?
    if won? || draw?
      true else false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? do |win_combination_index|
        board.cells[win_combination_index] == "X" ||
        win_combination.all? do |win_combination_index|
          board.cells[win_combination_index] == "O"
        end
      end
    end
  end

  def draw?
    if board.full? && !won?
      true else false end
    end

    def winner
      if WIN_COMBINATIONS.detect do |win_combination|
        win_combination.all? do |win_combination_index|
          board.cells[win_combination_index] == "X"
        end
      end
      then return "X"
    end
    if WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? do |win_combination_index|
        board.cells[win_combination_index] == "O"
      end
    end
    then return "O"
  end
end

def turn
  input = current_player.move(board)
  if board.valid_move?(input)
    board.update(input, current_player)
    @board.display
  elsif input == "quit"
    exit
  else
    puts "Oops, Try Another Space"
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
