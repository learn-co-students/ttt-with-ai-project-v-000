require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :token

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    # use instance variable board, because #turn_count is an 
    # instance method
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end
  end

  def over?
    won? || draw?
  end
  
  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    index = input.to_i
    while true
      @board.update(input, current_player)
      @board.display
      break if index.between?(0, 8) == false || @board.valid_move?(input) == false
      puts "invalid"
    end 
  end
  
  # def turn
  #   puts "Please enter 1-9:"
  #   player = current_player
  #   current_move = player.move(@board)
  #   if !@board.valid_move?(current_move)
  #     turn
  #   else
  #     puts "Turn: #{@board.turn_count+1}\n"
  #     # @board.display
  #     @board.update(current_move, player)
  #     puts "#{player.token} moved #{current_move}"
  #     @board.display
  #     puts "\n\n"
  #   end
  # end
  
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else puts "Cat's Game!"
    end
    self.post_game
  end

  def start_game
    puts "Welcome to Tic Tac Toe!"
    puts "Please choose player mode:
      0 - Computer AI
      1 - One-Player
      2 - Two-Player"

    player_mode = gets.strip
    
    # player_1 = nil
    # player_2 = nil
    
    case player_mode
    when "0"
      puts "Excellent! Enjoy the battle of the bots!"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
      self.play
    when "1"
    puts "Choose your alliance! X - O ?"
    side = gets.chomp
    if side == "X" || side == "x"
      @player_2 = Players::Computer.new("O")
      @player_1 = Players::Human.new("X")
      # @player_2.board = self.board
    elsif side == "O" || side == "o"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Human.new("O")
      # @player_1.board = self.board
    else 
      puts "Incorrect input..."
      puts "Restarting..."
      self.start_game
    end 
    puts "Game starting..."
    @board.display
    self.play
    when "2"
      puts "Player X will go first"
      puts "Initializing!"
      self.play
    else 
      puts "Incorrect input..."
      puts "Restarting..."
      self.start_game
    end
  end
    
  def post_game
    puts "Would you like to play again? (y/n)"
    continue = gets.strip
 
    case continue
    when "y" || "Y"
      puts "Restarting..."
      @board.reset!
      self.start_game
    when "N" || "n"
      puts "Thank for playing!"
      exit
    else 
      puts "I didn't understand you."
      self.post_game
    end
  end 

end