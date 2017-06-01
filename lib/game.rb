class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6], # Right diagonal
  ]

  def initialize(player_1="", player_2="", board=Board.new)
    @board = board
    player_1 == "" ? @player_1 = Players::Human.new("X") : @player_1 = player_1
    player_2 == "" ? @player_2 = Players::Human.new("O") : @player_2 = player_2 
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
  no_win = true
    WIN_COMBINATIONS.each do |win_array|
      win = []
      win_array.select do |position|
        if @board.taken?(position + 1)
          win << position
          if win.length == 3 && win_array == win && (@board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[0]] == @board.cells[win[2]])
            no_win = false
            return win_array
          end
        end
      end
    end
    if no_win
     false
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    (won? && @board.full?) || draw?
  end

  def winner
    !won? ? nil : won?.detect{|position| return @board.cells[position]}
  end

  def turn
    input = current_player.move(@board)
    until @board.valid_move?(input)
      "invalid"
      input = current_player.move(@board)
    end
    @board.update(input, current_player)
  end

  def play
    until over? || draw? || won?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def start
    input = ""
    puts "Welcome to Elena's super fun Tic Tac Toe!"
    until input == "exit"
      puts "What kind of game would you like to play? Enter 0, 1 or 2 (for 0, 1, or 2 player game): " 
      player_mode = gets.chomp
      until player_mode == "0" || player_mode == "1" || player_mode == "2"
        puts "Invalid option. Enter 0, 1 or 2:"
        player_mode = gets.chomp
      end
      if player_mode == "0"
        computer_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        computer_game.play
      end
      if player_mode == "1"
        puts "Would you like to be X or O?"
        token = gets.chomp
        until token == "X" or token == "O"
          puts "Invalid option. Enter X or O: "
          token = gets.chomp
        end
        token == "X" ? computer_token = "O" : computer_token = "X"
        one_player = Game.new(Players::Human.new(token), Players::Computer.new(computer_token))
        one_player.play
      end
      if player_mode == "2"
        puts "Player 1, would you like to be X or O?"
        player_1_token = gets.chomp
        until player_1_token == "X" or player_1_token == "O"
          puts "Invalid option. Enter X or O: "
          player_1_token = gets.chomp
        end
        player_1_token == "X" ? player_2_token = "O" : player_2_token = "X"
        two_player = Game.new(Players::Human.new(player_1_token), Players::Human.new(player_2_token))
        two_player.play
      end
      puts "Would you like to play again? Type any key to play again or \"exit\" to leave"
      input = gets.chomp
    end
  end

end
