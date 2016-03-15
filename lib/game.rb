class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end  

  #state of the Game methods
  def current_player
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0]+1)
    end
  end

  def draw?
    !self.won? && board.full?
  end

  def winner
    #if #won? method returns a winning combo
    #make won?[0] the index value
    #and return the item in board.cells[index value]
    if won?
      board.cells[won?[0]]
    end
  end

  #managing a Game methods
  def play
    while !over?
      turn
    end
    if won?
      puts "**************************"
      puts "We have a winner!"
      puts "Congratulations #{winner}!"
      puts "**************************"
      board.display
    else draw?
      puts "**************************"
      puts "     _._     _,-''''`-._   "
      puts "     (,-.`._,'(       |\`-/|"
      puts "         `-.-' \ )-`( , o o)"
      puts "               `-    \`_`''-"
      puts "Cats Game!"
      puts "**************************"
      board.display
    end
  end

  def turn
    puts "\n"
    board.display
    position = current_player.move(board)
    if board.valid_move?(position)
      board.update(position, current_player)
    else
      "Please input a valid number."
      turn
    end
  end

  # initializing a game methods
  def start
    until over?
      game_option_selector
      play
    end
    game_restart_selector
  end

  def game_restart_selector
    #asks user if would like to play again
    #if yes, recurses back to new instance of Game class
    #if no, ends session
    puts "Would you like to play again? 'y' or 'n' "
    input = gets.chomp.downcase
    if input == 'n'
      puts "\n"
      puts "See you later! It's been tic-tac-tabulous playing!"
    else input == 'y'
      self.class.new.start
    end
  end

  def game_option_selector
    #asks user to select game type
    #then jumps to appropriate game method
    puts "\n"
    puts "Pick a game option: "
    puts "'0' for zero humans and two computers"
    puts "'1' for one human and one computer"
    puts "'2' for two humans"
    puts "Please input '0' '1' or '2': "
    input = gets.chomp
    if input == "0"
      zero_game_option
    elsif input == "1"
      one_game_option
    elsif input == "2"
      two_game_option
    else
      puts"\n"
      puts "That's an invalid option."
      game_option_selector
    end
  end

  def zero_game_option
    puts"\n"
    puts "The Computers will battle."
    puts"\n"
    puts "Will Computer 1 be 'X' or 'O'? Please input 'X' or 'O': "
    computer_one_token = gets.chomp.upcase
    computer_two_token = other_token(computer_one_token)
    puts"\n"
    puts "Great! Computer 1 will be #{computer_one_token} and Computer 2 will be #{computer_two_token}."
    self.player_1 = Computer.new(computer_one_token)
    self.player_2 = Computer.new(computer_two_token)
  end

  def one_game_option
    puts"\n"
    puts "The Human wants to battle the Computer."
    puts"\n"
    puts "Will you go first or second? Please input '1' or '2': "
    human_turn = gets.chomp
    computer_turn = human_turn == '1' ? '2' : '1'
    puts"\n"
    puts "Will you be 'X' or 'O'? Please input 'X' or 'O': "
    human_token = gets.chomp.upcase
    computer_token = other_token(human_token)
    puts"\n"
    puts "Great! You will take turn #{human_turn} as #{human_token}\nand the Computer will take turn #{computer_turn} as #{computer_token}."
    if human_turn == '1'
      self.player_1 = Human.new(human_token)
      self.player_2 = Computer.new(computer_token)
    elsif human_turn == '2'
      self.player_1 = Computer.new(computer_token)
      self.player_2 = Human.new(human_token)
    else
      puts"\n"
      puts "That's an invalid option."
      one_game_option
    end
  end

  def two_game_option
    puts"\n"
    puts "The Humans want to battle mano-y-mano."
    puts"\n"
    puts "Who will go first? Please type a name: "
    human_one = gets.chomp
    puts"\n"
    puts "Who will go second? Please type a name: "
    human_two = gets.chomp
    puts"\n"
    puts "Will #{human_one} be 'X' or 'O'? Please input 'X' or 'O': "
    human_one_token = gets.chomp.upcase
    human_two_token = other_token(human_one_token)
    puts"\n"
    puts "Great! #{human_one} will go first as #{human_one_token}\nand #{human_two} will go second as #{human_two_token}"
    self.player_1 = Human.new(human_one_token)
    self.player_2 = Human.new(human_two_token)
  end

  def other_token(selected_token)
    #assigns default token of X or O based on what is left over
    selected_token == "X" ? "O" : "X"
  end

end