class Game 
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row 
    [3,4,5], # Middle Row 
    [6,7,8], # Bottom Row 
    [0,3,6], # Left Column 
    [1,4,7], # Middle Column 
    [2,5,8], # Right Column 
    [0,4,8], # Negative-Slope Diagonal
    [6,4,2], # Positive-Slope Diagonal
  ]
    
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    
    @player_1 = player_1
    @player_2 = player_2 
    @board = board
  end
  
  def current_player # Note: player_1 obviously goes first 
    board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      board_token_1 = self.board.cells[win_combo[0]]
      board_token_2 = self.board.cells[win_combo[1]]
      board_token_3 = self.board.cells[win_combo[2]]
      
      !self.blank?(board_token_1) && board_token_1 == board_token_2 && board_token_2 == board_token_3
    end
  end
  
  def blank?(board_token)
    board_token.nil? || board_token == "" || board_token == " "
  end 
  
  def draw?
    self.board.full? && !self.won?
  end
  
  def over? 
    self.won? || self.draw?
  end
  
  def winner 
    # Not sure if it's faster to call #won? twice or set win_combo equal to #won?
    win_combo = self.won?
    self.board.cells[win_combo.first] unless win_combo.nil?
  end
  
  def turn # Not sure if it's faster to call #current_player twice or make a local var.
    self.board.display
    
    player = self.current_player
    puts "\n#{player.token}'s turn!"
    
    player_choice = player.move(self.board)
    
    if self.board.valid_move?(player_choice)
      self.board.update(player_choice, player)
    else 
      puts "Sorry. That is not a valid move. Please try again."
      self.turn 
    end
  end
  
  def play 
    until self.over?
      self.turn
    end
    
    self.board.display 
    
    puts self.message_for(self.winner)
    
    # Note: This last part is for Wargames: 
    self.draw? ? 0 : 1
  end
  
  def message_for(winning_player) 
    winning_player ? "Congratulations #{winning_player}!" : "Cat's Game!"
  end
  
  def self.start
    board = Board.new
    first_player = nil # Note: this is only for human vs. computer
    
    puts "\nWelcome to Tic Tac Toe!"
    
    number_of_players = self.player_mode
    
    if number_of_players == "wargames"
      self.wargames(board)
    else
      if number_of_players == "1" # Human vs. computer
      first_player = self.player_order
      end
    
      first_player_token = self.player_one_token_choice
      second_player_token = first_player_token == "X" ? "O" : "X"
      
      # Gameplay starts here:
      puts "\nOK! Let's start the game!"
  
      case number_of_players
      when "0"
        self.new(Players::Computer.new(first_player_token), 
        Players::Computer.new(second_player_token), board).play
        
      when "1"
        puts "Fair warning: It's impossible to defeat the computer!\n"
        
        if first_player == "human" || first_player == "Human"
          self.new(Players::Human.new(first_player_token), 
          Players::Computer.new(second_player_token), board).play
        else 
          self.new(Players::Computer.new(first_player_token), 
          Players::Human.new(second_player_token), board).play
        end
        
      when "2"
       self.new(Players::Human.new(first_player_token), 
       Players::Human.new(second_player_token), board).play
       
      else # Ideally, this will never execute
        puts "Oops! Something went wrong here. Please contact the game's programmer."
      end
    end 
  end
  
  def self.player_mode
    player_options = ["0", "1", "2", "wargames"]
    players = nil 
    
    until player_options.include? players
      puts "\nSelect a game mode! How many players?"
      puts "Select 2 for human vs. human."
      puts "Select 1 for human vs. computer."
      puts "Select 0 for computer vs. computer."
      puts "Finally, select wargames for a fun surprise!"
      players = gets.strip 
    end
    
    players
  end
  
  def self.player_one_token_choice
    first_player_token = nil 
    
    until first_player_token == "X" || first_player_token == "O"
      puts "\nShould Player 1 be X or O?"
      first_player_token = gets.strip
    end
    
    first_player_token
  end 
  
  def self.player_order # This is only for human vs. computer
    player_one_options = ["Human", "human", "Computer", "computer"]
    first_player = nil
    
    until player_one_options.include?(first_player)
      puts "\nWho should go first? Human or Computer?"
      first_player = gets.strip
    end
    
    first_player
  end
  
  def self.wargames(board)
    number_of_times_won = 0
    100.times do 
      number_of_times_won += self.new(Players::Computer.new("X"), 
      Players::Computer.new("O"), board).play
    end
    
    puts "Number of wins: #{number_of_times_won}\n"
    if number_of_times_won == 0
      puts "\nA strange game."
      puts "The only way to win is not to play."
      puts "...How about a nice game of chess?"
    end
  end 
end