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
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    !won? && @board.full?
  end

  def over?
     won? || draw? || @board.full?
  end

  def winner
    if winning_combination = won?
      @board.cells[winning_combination[0]]
    end
  end


  def play
    until over? do
      turn
    end
     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
     puts "Would you like to play again? Please enter 'Yes' or 'No'."

     if gets.strip.downcase == "no"
       exit
     else
       CLI.new.call
     end
  end

   def turn
     puts "It is your turn, #{current_player.token}"
     input = current_player.move(board)
     if @board.valid_move?(input)
        @board.update(input, current_player)
        @board.display
     else
       turn
     end
   end

end
