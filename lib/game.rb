class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #-----returns the next player-----#
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  #-----iterate over win_combo array and compare with current board pos to see if all "X"s or all "O"s-----#
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.position(combo[0]+1) == board.position(combo[1]+1) &&
      board.position(combo[1]+1) == board.position(combo[2]+1) &&
      board.taken?(combo[0]+1)
    end
  end

  def draw?
    board.full? && !won?
  end

  #-----use results from won? to return player token-----#
  def winner
    board.position(won?[0]+1) if won?
  end

  #-----makes a valid move-----#
  def turn
    puts "#{current_player.name}, where would you like to move?"
    board.display
    current_move = current_player.move(board)
    if board.taken?(current_move)
      puts "Sorry, that spot is taken. Please select an open position."
      turn
    elsif !board.valid_move?(current_move)
      puts "Sorry, valid moves are positions 1-9. Please enter a valid move."
      turn
    else
      puts "Turn #{board.turn_count + 1}: #{current_player.name} moves to position #{current_move}."
      board.update(current_move, current_player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      board.display
    elsif draw?
      puts "Cats Game!"
      board.display
    end
  end

  #-----initial game setup-----#
  def self.start
    puts "Would you like to play a 0, 1, or 2 player game?"
    players = gets.chomp.to_i
    case players
      when 0
        game = Game.new(Computer.new("X", "Computer 1"), Computer.new("O", "Computer 2"))
      when 1
        puts "What is your name, player?"
        player_name = gets.chomp
        game = Game.new(Human.new("X", player_name), Computer.new("O", "Computer"))
      when 2
        puts "What is Player 1's name?"
        player_name_1 = gets.chomp
        puts "What is Player 2's name?"
        player_name_2 = gets.chomp
        puts "Which player would you like to go first? #{player_name_1} or #{player_name_2}?"
        first_player = gets.chomp
        if first_player == player_name_1
          game = Game.new(Human.new("X", player_name_1), Human.new("O", player_name_2))
        elsif first_player == player_name_2
          game = Game.new(Human.new("X", player_name_2), Human.new("O", player_name_1))
          else
          self.start
        end
      else
        puts "Sorry, please select a 0, 1, or 2 player game."
      self.start
    end
    puts "Board positions are as follows:"
    game.board.initial_display
    sleep(5)
    until game.over?
      game.play
    end
    puts "Would you like to play again?"
    play_again = gets.chomp.downcase
    if play_again == "y" || play_again == "yes"
        self.start
      else
        puts "Thanks for playing Tic-Tac-Toe!"
    end
  end

end