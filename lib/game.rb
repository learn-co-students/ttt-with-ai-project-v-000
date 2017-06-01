class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
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

  def over?
    won? || draw?
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    won? ? @board.position((won?[0] + 1).to_s) : nil
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
      player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{@board.turn_count}\n"
        @board.display
        @board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        @board.display
        puts "\n\n"
      end
    end

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def start
        input = ""
        puts "Welcome to Tic Tac Toe!"
        until input == "exit"
          puts "What kind of game would you like to play (for 0, 1, or 2 player game)?: "
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
            puts "Where would you like to place your token?"
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
            puts "Where would you like to place your token Player 1?"
            two_player.play
          end
          puts "Would you like to play again? Type any key to play again or \"exit\" to leave"
          input = gets.chomp
        end
      end
end
