require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row_win
    [3, 4, 5], #middle_row_win
    [6, 7, 8], #bottom_row_win
    [0, 3, 6], #left_collumn_win
    [1, 4, 7], #middle_collumn_win
    [2, 5, 8], #right_collumn_win
    [0, 4, 8], #left_diagonal_win
    [2, 4, 6] #right_diagonal_win
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || self.board.full?
  end

  def won?
    winner != nil
  end

  def draw?
    !won? && board.full?
  end

  def is_winning_combo(combo) # returns true when elements in a combo are all X or all O
    # example combo ["X", "O", " "]
    combo.all? { |el| el == combo[0] && combo[0] != " "}
  end

  def winner # returns "X" if X won and "O" if O won and nil if there is no winner
    winning_combo = board.get_filled_win_combinations.detect { |combo| is_winning_combo(combo) }
    winning_combo != nil ? winning_combo[0] : nil
  end

  def turn
    player = current_player
    puts "#{current_player.token} is taking their turn..."
    sleep 3
    move = player.move(board)
    if board.valid_move?(move)
      board.update(move, player)
      board.display
      sleep 3
    else
      invalid_selection
      sleep 1
      board.display
      sleep 3
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def who_first?
    puts "Who should go first as X?"
    puts "Your options are:"
    puts "0 = computer, if you wanted to play the computer"
    puts "1 = you"
    puts "2 = your friend, if they wanted to play"
    puts "3 = exit if you've changed your mind"
    gets.chomp
  end

  def mixed_computer_first
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Human.new("O")
    puts "The players are 1) Computer = X and 2) you = O"
  end

  def mixed_human_first
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Computer.new("O")
    puts "The players are 1) you = X and 2) Computer = O"
  end

  def human_only
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Human.new("O")
  end

  def computer_only_game
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Computer.new("O")
    puts "The players are 1) Computer = X and 2) Computer = O"
  end

  def mixed_game
    first = who_first?
    case first
      when "0" then mixed_computer_first
      when "1" then mixed_human_first
      when "exit" then goodbye
      else invalid_selection
        who_first?
    end
  end

  def human_only_game
    first = who_first?

    case first
      when "1" then human_only
        puts "The players are 1) you = X and 2) your friend = O"
      when "2" then human_only
        puts "The players are 1) your friend = X and 2) you = O"
      when "exit" then goodbye
      else invalid_selection
        who_first?
    end
  end

  def invalid_selection
    puts "Your selection is invalid. Please select again."
    sleep 1
  end

  def self.game_selection
    puts "0 = Computer versus Itself"
    puts "1 = Computer versus You"
    puts "2 = You versus your Human Friend"
    puts "exit = leave this game if you've changed your mind"
    # puts "Please pick wisely - invalid selections will terminate this dialogue."
    puts "What do you choose?"
    gets.chomp
  end

  def goodbye # politely leave the program
    puts "Thank you and farewell!"
    exit
  end

  def self.start # CLI setup here
    puts "Hello there! Would you like to play a game of Tic Tac Toe? Please select from the following:"
    # game_selection
    game_type = game_selection
    new_game = self.new()
    case game_type
      when "0" then new_game.computer_only_game
      when "1" then new_game.mixed_game
      when "2" then new_game.human_only_game
      when "exit" then goodbye
      else new_game.invalid_selection
        game_type = game_selection
    end
    new_game.board.display
    new_game.play
    if new_game.over?
      puts "Would you like to play another game? 1 = Yes, 2 = No"
      another = gets.chomp
      another == "1" ? self.start : goodbye
    end
  end

end
