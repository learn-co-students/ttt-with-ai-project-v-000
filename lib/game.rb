class Game
  attr_accessor :board,:player_1,:player_2

WIN_COMBINATIONS_GAME = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1 = Human.new("X"),player_2 = Human.new("O"),board = Board.new)
    @player_1 = player_1
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
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    self.won?||self.draw?
  end

  def won?
    if self.winner == "X" || self.winner == "O" 
      return true
    else
      return false
    end
  end

  def draw?
    !self.won? && !@board.cells.any?{|x| x == " " || x == "" }
  end

  def winner
    WIN_COMBINATIONS_GAME.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]

    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
   end
    return nil
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