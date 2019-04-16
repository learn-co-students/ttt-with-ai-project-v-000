class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  TRAPS = [
    [0,4,2],
    [0,4,8],
    [2,4,8],
    [4,6,8],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # accepts 2 players and a board
    # defaults to two human players, X and O, with an empty board
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def cells
    @board.cells
  end

  def turn_count
  count = 0
  cells.each do |play|
    if play == "O" || play == "X"
      count +=1
    end
  end
  count
end

  def current_player
    # returns the correct player, X, for the third move
    if turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    # returns false for a draw
    # returns the correct winning combination in the case of a win
    # isn't hard-coded
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| cells[idx] == "X"}
        winner = combo
      elsif combo.all? {|idx| cells[idx] == "O"}
        winner = combo
      else
        false
      end
    end
    if winner != nil
      winner
    else
      false
    end
  end

  def full?
    cells.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    # returns true for a draw
    # returns false for a won game
    # returns false for an in-progress game
    if full? && !(won?)
      true
    else
      false
    end
  end

  def over?
    # returns true for a draw
    # returns true for a won game
    # returns false for an in-progress game
    if draw? || won? || full?
      true
    else
      false
    end
  end
  def winner
    # returns X when X won
    # returns O when O won
    # returns nil when no winner
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| cells[idx] == "X"}
        return "X"
      elsif combo.all? {|idx| cells[idx] == "O"}
        return "O"
      end
    end
    nil
  end
  def turn
    # makes valid moves
    # asks for input again after a failed validation
    # changes to player 2 after the first turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
    elsif input == "exit"
      quit
    elsif input == "instructions"
      instructions
    else
      turn
    end
  end

  # def play
  #   @board.display
  #   until over?
  #     turn
  #   end
  #   if won?
  #     puts "Congratulations #{winner}!"
  #   elsif draw?
  #     puts "Cat's Game!"
  #   end
  # end

  def play
    instructions
    puts "New Game:"
    puts
    @board.display
    puts
    until over?
      if turn_count.even?
        player_number = "1"
      else
        player_number = "2"
      end
      puts "Player #{player_number}'s turn"
      puts
      turn
      puts
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    end_game
  end

  def end_game
    puts
    puts "Would you like to play again? Y or N?"
    reply = gets.chomp
    if reply.upcase == "Y"
      config
    else
      puts
      puts "Thank you for playing Tic Tac Toe!"
      exit
    end
  end

  def self.welcome
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def instructions
    puts
    puts "To play, please enter a number between 1-9 when prompted to place your token in the cells in the area numbered on the board below:"
    puts
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts
    puts "To ask for instructions anytime, type 'instructions,' or to exit, type 'exit.'"
    puts
  end

  def self.start
    welcome
    puts "To begin, please select 0, 1, or 2 players:"
    number = gets.chomp
    if number == "0"
      Game.new(Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    elsif number == "1"
      puts "Do you want to go first as 'X'? Y or N."
      ans = gets.chomp
      if ans.downcase == "yes" || ans.downcase == "y"
        puts "You are Player 1."
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif ans.downcase == "n" || ans.downcase == "no"
        puts "You are Player 2."
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      end
    elsif number == "2"
      puts "Thank you."
      puts
      puts "Player 1, please go first."
      Game.new(Players::Human.new("X"), player_2 = Players::Human.new("O")).play
    else
      Game.start
    end
  end

  def quit
    puts
    puts "Are you sure you want to end game? Y or N."
    ans = gets.chomp
    if ans.downcase == "yes" || ans.downcase == "y"
      puts "You lose."
      end_game
    elsif ans.downcase == "n" || ans.downcase == "no"
    else
      quit
    end
  end

  def config
  puts "Do you need a new configuration? Y or N"
  ans = gets.chomp
    if ans.upcase == "Y"
      Game.start
    elsif ans.upcase == "N"
      @board.reset!
      play
    else
      config
    end
  end
end
