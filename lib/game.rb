require "pry"
class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.cells.count {|cell| cell != " "}.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
    return false
  end

  def draw?
    board.cells.all? {|cell| cell != " "} && won? == false
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    player_move = current_player.move(board)
    if board.valid_move?(player_move)
      board.update(player_move, current_player)
      board.display
    else
      if current_player.is_a? Players::Human
        puts "*Invalid move. Please enter a number 1-9 corresponding to a blank space.*"
      end
      turn
    end
  end

  def play
    until over?
      puts "*#{current_player.token}, it's your turn*"
      turn
    end
    if won?
      puts "*Congratulations #{winner}!*"
    elsif draw?
      puts "Cat's Game!"
    end
    puts "*Would you like to play again?*"
    puts "-Enter 1 to play another game."
    puts "-Enter any other number to exit Tic Tac Toe."
    answer = gets.to_i
    if answer == 1
      choose_game_type
    else
      exit
    end
  end

  def start
    puts "*To make your move, enter a number 1-9 at the corresponding space "
    puts "on the board you would like to place your token.*"
    puts " 1 | 2 | 3"
    puts "-----------"
    puts " 4 | 5 | 6"
    puts "-----------"
    puts " 7 | 8 | 9"
    play
  end

  def player_vs_computer
    puts "*Please enter the number of the token you'd like to be.*"
    puts
    puts "1. X"
    puts "2. O"
    chosen_token = gets.to_i
    if chosen_token == 1
      puts "*You have chosen X. The computer will be O*"
      puts "*Who would like to go first?*"
      puts
      puts "-Enter 1 for player to go first."
      puts "-Enter 2 for computer to go first."
      while first_player = gets.to_i
        if first_player == 1
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).start
        elsif first_player == 2
          Game.new(Players::Computer.new("O"), Players::Human.new("X")).start
        else
          puts "*Please enter 1 for player to go first, or 2 for computer to go first.*"
        end
      end
    elsif chosen_token == 2
      puts "*You have chosen O. The computer will be X*"
      puts "*Who would like to go first?*"
      puts
      puts "-Enter 1 for player to go first."
      puts "-Enter 2 for computer to go first."
      while first_player = gets.to_i
        if first_player == 1
          Game.new(Players::Human.new("O"), Players::Computer.new("X")).start
        elsif first_player == 2
          Game.new(Players::Computer.new("X"), Players::Human.new("O")).start
        else
          puts "*Please enter 1 for player to go first, or 2 for computer to go first.*"
        end
      end
    else
      puts "*Ivalid input.*"
      player_vs_computer
    end
  end

  def player_vs_player
    puts "*Player one, please enter the number of the token you would like to be*"
    puts
    puts "1. X"
    puts "2. O"
    chosen_token = gets.to_i
    if chosen_token == 1
      puts "*Player one has chosen X. Player two will be O.*"
      puts "*Who would like to go first?*"
      puts
      puts "-Enter 1 for X to go first."
      puts "-Enter 2 for O to go first."
      while first_player = gets.to_i
        if first_player == 1
          Game.new(Players::Human.new("X"), Players::Human.new("O")).start
        elsif first_player == 2
          Game.new(Players::Human.new("O"), Players::Human.new("X")).start
        else
          puts "*Please enter 1 for player to go first, or 2 for computer to go first.*"
        end
      end
    elsif chosen_token == 2
      puts "*Player one will be O. Player two will be X.*"
      puts "*Who would like to go first?*"
      puts
      puts "-Enter 1 for O to go first."
      puts "-Enter 2 for X to go first."
      while first_player = gets.to_i
        if first_player == 1
          Game.new(Players::Human.new("O"), Players::Human.new("X")).start
        elsif first_player == 2
          Game.new(Players::Human.new("X"), Players::Human.new("O")).start
        else
          puts "*Please enter 1 for player to go first, or 2 for computer to go first.*"
        end
      end
    else
      puts "*Invalid input.*"
      player_vs_player
    end
  end

  def computer_vs_computer
    puts "*The computer will play itself.*"
    puts "*Who should go first?*"
    puts
    puts "-Enter 1 for X to go first."
    puts "-Enter 2 for O to go first."
    while first_player = gets.to_i
      if first_player == 1
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      elsif first_player == 2
        Game.new(Players::Computer.new("O"), Players::Computer.new("X")).play
      else
        puts "*Enter 1 for X to go first, or enter 2 for O to go first.*"
      end
    end
  end


  def choose_game_type
    puts "*Please enter the number of the type of game you would like to play*"
    puts
    puts "1. Player vs. Computer"
    puts "2. Player vs. Player"
    puts "3. Computer vs. Computer"
    game_type = gets.to_i
    if game_type == 1
      Game.new.player_vs_computer
    elsif game_type == 2
      Game.new.player_vs_player
    elsif game_type == 3
      Game.new.computer_vs_computer
    else
      puts "*Invalid input.*"
      choose_game_type
    end
  end

end
