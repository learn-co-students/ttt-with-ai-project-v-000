class Game  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @winner = nil
  end
  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal Top Left
  [2,4,6]  # Diagonal Top Right
  ]
  
  def current_player
    if @board.turn_count.even?
      player_1
    else 
      player_2
    end
  end
  
  def won?
    winning_combo = nil
      WIN_COMBINATIONS.any? do |combo|
        if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
           winning_combo = combo
           @winner = "X"
        elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
           winning_combo = combo
           @winner = "O"
        end
      end
      winning_combo
  end 
  
  def draw?
    if !won? && @board.full?
      TRUE
    else
      FALSE
    end
  end
  
  def over?
    if won? || draw?
      TRUE
    else
      FALSE
    end
  end
  
  def winner
    if won?
      @winner
    end
  end
  
  def turn
    move = nil
    while !@board.valid_move?(move)
    move = current_player.move(@board)
    end
    @board.update(move, current_player)
  end
  
  def play
    while !self.over?
    puts "It's #{current_player}'s turn!"
    puts "Choose a valid move"
    puts "Numbers 1-9 correspond to each space"
    @board.display
    self.turn
    end

    if won? 
      puts "Congratulations #{@winner}!"
      @board.display
    else
      puts "Cat's Game!"
      @board.display
    end
  end
  
end