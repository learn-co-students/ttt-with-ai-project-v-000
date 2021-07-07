

class Game
  attr_accessor :board,:player_1,:player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 #assigns to variables
    @player_2 = player_2
    @board = board
  end
  
  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2 #calls turn count method, player 1 odd turns, player 2 even turns, if remainder of 0 player 2 turn, remainder  of 1 player 1 turn, if turn count divided by 2, == comparison operator, has a 0 reaminder then it will be player 1 turn, and : if not player 2 turn
  end

  def over?
    self.won?||self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|  #iterate over an array with fewer elements-use detect
    @board.cells[winner[0]] == @board.cells[winner[1]] && 
    @board.cells[winner[1]] == @board.cells[winner[2]] && 
    #@board.cells[winner[0]] == "X" | @board.cells[winner[0]] == "O" #checking to see if winning cell has an X or an O
  end

  def draw?
   @board.full? && !won? # if board is full and no one has won
  end

  def winner
    if a winning_combo = won? #if winning combo = true
      @winner = @board.cells[winning_combo.first]
    end
  end    
  ##turn method that displays both guide and board every iteration
  def turn
    puts "## GUIDE ##"
    @board.display_intro
    puts "#GAMEBOARD#"
    @board.display
    puts "###########"
    puts "It's #{self.current_player.token}'s turn. Please enter location:"
    x = self.current_player.move
    if @board.valid_move?(x)
      @board.update(x,current_player)
    else
      puts "Invalid move. Please try again"
      self.turn
    end
  end
  ##play method that allows the turn method to run until the game is over
  def play
    while !self.over?
    self.turn
    end
    if self.won?
     puts "Congratulations #{self.winner}!"
     puts "###########"
     @board.display
     puts "#GAME OVER#"
     elsif self.draw?
     puts "Cats Game!"
     puts "###########"
     @board.display
     puts "#GAME OVER#"
    end
  end
  ##reset the players as we start a new game
  def reset_game
    @player_1 = Human.new("X")  
    @player_2 = Human.new("O")
    @board.reset!
  end
  ##again method to call at the end of each game
  def again?
  puts "Do you want to play a new game? (Y/N)"
      ans = gets.chomp
      if ans == "Y"
        self.reset_game
        self.start
      elsif ans == "N"
        puts "Okay then, have a nice day! Thanks for playing."
      else
        puts "Invalid answer. Answer with Y or N"
        self.again?
      end
  end
  ##method that is called for 0 human players
  def play_two_ai
    puts "Enjoy the game between 2 Computers"
      @player_1 = Computer.new("X")
      @player_1.board = self.board
      @player_2 = Computer.new("O")
      @player_2.board = self.board
      self.play
      self.again?
  end
  ##method that is called for 1 human player
  def play_against_ai
    puts "Choose your side: X or O"
      side = gets.chomp
      if side == "X"
        @player_2 = Computer.new("O")
        @player_2.board = self.board
      elsif side == "O"
        @player_1 = Computer.new("X")
        @player_1.board = self.board
      else
        puts "Invalid entry. Game restarting..."
        self.start  
      end
      puts "Game starting..."
      self.play
      self.again?
  end
  ##method that is called for 2 human players
  def play_two_humans
    puts "Let's begin"
      self.play
      self.again?
  end

  def start  ###engage CLI 
    puts "Welcome to Tic Tac Toe - 3 versions"
    puts "Enter number of players: (0-2)"
    answer = gets.chomp
    case answer
    when "0"
      self.play_two_ai
    when "1"
      self.play_against_ai
    when "2"
      self.play_two_humans
    else
      puts "Invalid entry. Game restarting..."
      self.start
    end
  end
end
