class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    if player_1.instance_of? Players::Computer
      player_1.instance_variable_set(:@game, self)
    end
    if player_2.instance_of? Players::Computer
      player_2.instance_variable_set(:@game, self)
    end
  end
  
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end
  
  def won?
    if WIN_COMBINATIONS.detect{|c|
      (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") || (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")}.nil?
      false
    else
      WIN_COMBINATIONS.detect{|c|
      (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") || (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")}
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || board.full? || won?
  end
  
  def winner
    if won?
      if board.cells.count {|position| position == "X"} > board.cells.count {|position| position == "O"} then "X"
      else "O"
      end
    end
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end
  
  def self.start_game
    puts "Welcome to Tic Tac Toe!"
    puts "Which game would you like to play?"
    puts "Enter '0' for the computer to play itself."
    puts "Enter '1' for you to play the computer."
    puts "Enter '2' for a two-player game."
    game_type = gets.strip
    while game_type != "0" && game_type != "1" && game_type != "2"
      puts "Invalid input."
      game_type = gets.strip
    end
    puts "Which player should go first--X or O?"
    first_token = gets.strip.upcase
    while first_token != "X" && first_token != "O"
      puts "Invalid input."
      first_token = gets.strip.upcase
    end
    if first_token == "X"
      second_token = "O"
    else
      second_token = "X"
    end
    case game_type
      when "0" then 
        game = self.new(player_1 = Players::Computer.new(first_token), player_2 = Players::Computer.new(second_token), board = Board.new)
      when "1" then
        puts "Who should go first--you or the computer?"
        puts "Enter '1' to go first or '2' for the computer to go first."
        first_player = gets.strip.upcase
        while first_player != "1" && first_player != "2"
          puts "Invalid input."
          first_player = gets.strip.upcase
        end
        if first_player == "1"
          game = self.new(player_1 = Players::Human.new(first_token), player_2 = Players::Computer.new(second_token), board = Board.new)
        else
          game = self.new(player_1 = Players::Computer.new(first_token), player_2 = Players::Human.new(second_token), board = Board.new)
        end
      when "2" then
        game = self.new(player_1 = Players::Human.new(first_token), player_2 = Players::Human.new(second_token), board = Board.new)
    end
    game.play
    self.end_game
  end
  
  def self.end_game
    puts "Would you like to play again?"
    puts "Enter '1' to play again. Hit any other key to exit."
    input = gets.strip
    if input == "1"
      self.start_game
    else
      exit
    end
  end
  
  def play
    board.display
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  
########Computer Methods##########

  def opposing_player
    if current_player == player_1
      player_2
    else
      player_1
    end
  end

  def almost_won?
    if over?
      false
    else
      combinations = WIN_COMBINATIONS.shuffle.detect {|c|
        t = current_player.token
        ((board.cells[c[0]] == t && board.cells[c[1]] == t) && board.cells[c[2]] == " ") || ((board.cells[c[1]] == t && board.cells[c[2]] == t) && board.cells[c[0]] == " ") || ((board.cells[c[0]] == t && board.cells[c[2]] == t) && board.cells[c[1]] == " ")}
      unless combinations.nil?
        combinations.collect {|p| p + 1}
      end
    end
  end
  
  def almost_lost?
    if over?
      false
    else
      combinations = WIN_COMBINATIONS.shuffle.detect {|c|
        t = opposing_player.token
        ((board.cells[c[0]] == t && board.cells[c[1]] == t) && board.cells[c[2]] == " ") || ((board.cells[c[1]] == t && board.cells[c[2]] == t) && board.cells[c[0]] == " ") || ((board.cells[c[0]] == t && board.cells[c[2]] == t) && board.cells[c[1]] == " ")}
      unless combinations.nil?
        combinations.collect {|p| p + 1}
      end
    end
  end
  
  def early?
    if over? || almost_won? || almost_lost?
      false
    else
      combinations = WIN_COMBINATIONS.shuffle.detect {|c|
        t = current_player.token
        (board.cells[c[0]] == t && board.cells[c[1]] == " " && board.cells[c[2]] == " ") || (board.cells[c[0]] == " " && board.cells[c[1]] == t && board.cells[c[2]] == " ") || (board.cells[c[0]] == " " && board.cells[c[1]] == " " && board.cells[c[2]] == t)}
      unless combinations.nil?
        combinations.collect {|p| p + 1}
      end
    end
  end
  
  def unwinnable?
    if early?
      false
    else
      position = board.cells.index {|c| c == " "}
      position + 1
    end
  end
  
  #def multiple_losing_combos
    #need a method for computer to take the position on the board where there is > 1 losing combination if the opposing player were to take that position
    #maybe refactor the #almost_lost method to #collect all losing combos and use this method to #detect which one to use and which position to take
  #end
  
  #def multiple_winning_combos
    
  #end
  
end