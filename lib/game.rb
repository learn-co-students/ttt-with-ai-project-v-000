require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new(token="X"), player_2 = Players::Human.new(token="O"), board = Board.new)
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
    #@board.full? == true
    @board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
        return combo
      elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
        return combo
      end 
    end 
    false
  end 

  def draw?
    #over? && won? == false
    @board.full? && won? == false
  end 

  def winner
    if won? 
      board.cells[won?[0]]
    end
  end 

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "You have made an invalid move! Please try again."
      turn
    end
  end

  def play
    until over?
      turn
    end 

    if won?
      puts "Congratulations #{winner}!"
    end 

    if draw?
      puts "Cat's Game!"
    end 
  end 

end   