class Game 
  include Players
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [2, 4, 6], # diagonal
  [0, 4, 8], # diagonal
  [0, 3, 6], # left coloumn
  [1, 4, 7], # middle coloumn
  [2, 5, 8]  # left coloumn
  ]
  
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2
    @board = board 
  end
  
  def current_player
    count = 0
    @board.cells.each do |spot| 
      if spot == "X" || spot == "O"
        count += 1 
      end 
    end 
    count % 2 == 0 ? @player_1 : @player_2
  end 
  
  def won?
 	  won = false
 	    
    WIN_COMBINATIONS.each do |win_combination|
      win = [@board.cells[win_combination[0]], @board.cells[win_combination[1]], @board.cells[win_combination[2]]]
      
      win == ["X", "X", "X"] || win == ["O", "O", "O"] ? won = win_combination : false
      end
      won
    end
  
  def winner
    win_combination = won?
    if win_combination == false
      nil
    elsif @board.cells[win_combination[0]] == "X"
      "X"
    elsif @board.cells[win_combination[0]] == "O"
      "O"
    end
  end
  
  def draw?
    if won? == false && @board.full?
      true 
    else 
      false
    end
  end
  
  def over?
    won? || @board.full?|| draw?
  end
  
  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.cells[input.to_i - 1] = current_player.token
      @board.display
    else
      turn
    end
  end
  
  def play
    while over? == false
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
  
  # NEEDS WORK
  # def start 
  #   puts "Welcome to Tic Tac Toe!"
  #   input = ''
  #   # until input == "N"

  #   puts "What kind of game would you like to play?"
  #   puts "Press 0 for a computer vs computer game"
  #   puts "Press 1 for a player vs computer game where player moves first"
  #   puts "Press 2 for a compter vs player game where computer moves first"
  #   puts "Press 3 for a player vs player game"

  #   input = gets.strip.to_i 

  #   case input 
  #   when input == 0 
  #   Game.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"))
  #   when input == 1
  #   Game.new(player_1 = Human.new("X"), player_2 = Computer.new("O"))
  #   when input == 2 
  #   Game.new(player_1 = Computer.new("X"), player_2 = Human.new("O"))
  #   when input == 3
  #     Game.new(player_1 = Human.new("X"), player_2 = Human.new("O"))
  #   end
  # end


end 