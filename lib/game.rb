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
     [6,4,2]
   ]


  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over? # fix this method
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|i| board.cells[i] == player_1.token}
        return win # why do i have to explicitly state return? if i don't, the test fails
      elsif win.all? {|i| board.cells[i] == player_2.token}
        return win
      end
    end
    return false # why do i have to explicitly state return? if i don't, the test fails
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      WIN_COMBINATIONS.each do |win|
        if win.all? {|i| board.cells[i] == player_1.token}
          return player_1.token # again, why do i have to explicity write return?
        elsif win.all? {|i| board.cells[i] == player_2.token}
          return player_2.token # same question as above comment.
        end
      end
    else
      nil
    end
  end

  def turn
    puts "Please enter a number 1-9"
    #binding.pry
    current_move = current_player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, current_player)
      board.display
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
