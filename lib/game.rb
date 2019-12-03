require "pry"
class Game
  attr_accessor :board, :player_1, :player_2, :human, :player
  WIN_COMBINATIONS = [
    [0,1,2], #top_row 
    [3,4,5], #middle
    [6,7,8], #bottom
    [0,3,6], #left_vertical
    [1,4,7], #middle_vertical
    [2,5,8], #right_vertical
    [0,4,8], #left_diagonal
    [2,4,6] #right_diagonal
    ]
  
  def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board || Array.new(9," ")
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if @board.turn_count % 2 == 0 
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_1 = win_combo[0]
      win_2 = win_combo[1]
      win_3 = win_combo[2]

      position_1 = @board.cells[win_1]
      position_2 = @board.cells[win_2]
      position_3 = @board.cells[win_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  false
end
  
  def full?
    @board.cells.all? do |box|
      box == "X" || box == "O"
    end
  end
  
  def draw?
    if !won? == true && full? == true
      return true
    end
    if won? == false || full? == false
      return false
    end
    if won? == true 
      return false
    end
  end
  
  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end
  
  def winner
    if win_combination = won?
      return @board.cells[win_combination.first]
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    #binding.pry
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end
  
  def play
    until over? == true
      turn
    end
  
    if won? && winner == "X"
      puts "Congratulations X!"
    end
    if won? && winner == "O" 
      puts "Congratulations O!"
    end
    if draw? == true
      puts "Cat's Game!"
    end
  end
end
