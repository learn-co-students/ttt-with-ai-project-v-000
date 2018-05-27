require 'pry'

class Game 
  attr_accessor :board, :player_1, :player_2, :player_1_wins, :player_2_wins, :catsgames
  WIN_COMBINATIONS = [
      [0, 1, 2], 
      [3, 4, 5], 
      [6, 7, 8], 
      [0, 3, 6], 
      [1, 4, 7], 
      [2, 5, 8], 
      [0, 4, 8], 
      [2, 4, 6]
    ]
    
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @player_1_wins = 0 
    @player_2_wins = 0
    @catsgames = 0
  end
  
  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end
  
  def won? 
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end
  
  def full?
    @board.cells.all? do |position|
      position == "X" || position == "O"
    end
  end
    
  def draw?
    !won? && !!full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      winning_positions = won?
      variable_location = winning_positions[0]
      if @board.cells[variable_location] == "X"
        @board.cells.detect{|x| x == "X"}
      else @board.cells.detect{|o| o == "O"}
      end
    end
  end
  
  def turn
    player = self.current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
    else
      turn
    end
  end
  
  def play
    until over?
      puts "Please enter 1-9:"
      turn
    end
    if won? 
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end
  
  def wargames_play
    until over?
      puts "Please enter 1-9:"
      turn
    end
    if won? == "X"
      puts "Congratulations #{winner}!"
      @player_1_wins += 1
    elsif won? == "O"
      puts "Congratulations #{winner}!"
      @player_2_wins += 1
    else
      puts "Cat's Game!"
      @catsgames += 1
    end
  end
end