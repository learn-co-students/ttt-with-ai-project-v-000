require 'pry'
class Game 
  attr_accessor :board, :player_1, :player_2, :winner
 
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end 
  
  def won?
   WIN_COMBINATIONS.detect do |win_combo|
    board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[1]] == board.cells[win_combo[2]] && (board.cells[win_combo[0]] == "X" || board.cells[win_combo[0]] == "O")
     end 
  end 
  
  #binding.pry
  
  def draw? 
    board.full? && !won?
  end 
  
  def over? 
    draw? || won?
  end 
  
  def winner
    if won?
      if board.cells[won?[0]] == "X"
        @winner = "X"
      elsif board.cells[won?[0]] == "O"
        @winner = "O"
      end 
    else 
      nil
    end 
  end 
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else 
      turn
    end 
  end 
  
  def play
    if !over?
      turn
      board.display
      puts "Next Move"
      play 
    elsif over?  
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end 
  end 
  
  def self.start 
    puts "Welcome to Tic Tac Toe!!"
    puts "How many players? 1, 2, or 0"
    input = gets.strip.to_i

    puts "Who goes first? For User: 1, and for Computer: 2"
    order = gets.strip.to_i

    if input == 1 && order == 1 
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
      Game.new(player_1, player_2).play
      game_over

    elsif input == 1 && order == 2 
      player_1 = Players::Computer.new("X")
      player_2 = Players::Human.new("O")
      Game.new(player_1, player_2).play
      game_over
      
    elsif input == 2 
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
      Game.new(player_1, player_2).play
      game_over
      
    elsif input == 0 
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
      Game.new(player_1, player_2).play
      game_over
    
    else 
      start
    end 
  end 
  
  def self.game_over 
    puts "GAME OVER"
    puts "Would you like to play again y/n"
    answer = gets.strip.upcase
    if answer == "Y"
      start
    else 
      puts "GoodBye!" 
    end 
  end 
      
end 