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
    [2,4,6],
  ]


  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def draw?
    board.full? && !won?
  end


  def won?
  	WIN_COMBINATIONS.each do |combo_array|
    		if board.cells[combo_array[0]] == board.cells[combo_array[1]] && board.cells[combo_array[2]] == board.cells[combo_array[0]] && board.cells[combo_array[2]] != " "
            	return combo_array
      		end
  	end
    #return false for no wins
  	return false
  end
  #determine if the game is over.  a win, draw, and full board return true
  def over?
    won? || draw? || board.full?
  end

  def winner
  #grab the result of the won? method (should be true or false)
    if won?
      #if there is a win, grab the returned winning combination array
      winning_combination = won?
      #check the first index in the winning combination against the matching board array index
              board.cells[winning_combination[0]]
        else
          nil
    end
  end

  def turn
    player = current_player
    index = player.move(@board)
      if board.valid_move?(index)
        #  def update(index, player)
        board.update(index, player)
      else
        #action for invalid move
        turn
      end
      board.display
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end




end
