require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combinations|
    index_1 = combinations[0]
    index_2 = combinations[1]
    index_3 = combinations[2]

    position_1 = @board.cells[index_1]
    position_2 = @board.cells[index_2]
    position_3 = @board.cells[index_3]

    position_1 == position_2 && position_2 == position_3 && position_3 != " "
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || board.full? || draw?
  end

  def winner
    won = won?
    if won
      @board.cells[won[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = current_player.move(board)
      if board.valid_move?(user_input)
        board.update(user_input, current_player)
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
       puts "Congratulations X!"
       puts "Congratulations O!"
     else
       puts "Cat's Game!"
     end
   end
end
