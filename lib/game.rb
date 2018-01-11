require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    win_combo = WIN_COMBINATIONS.find{|combo| board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "}
    win_combo == nil ? false : win_combo
  end

  def draw?
    won? == false && board.full?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    board.display
    puts "It's #{player.token}'s move."
    player_move = player.move(self.board.cells)

    if board.valid_move?(player_move)
      board.update(player_move, player)
    else
      puts "Sorry, that move is not valid. Please enter another position."
      turn
    end
  end

  def play
    turn until over?
    board.display
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Remmy's Tic Tac Toe!"
    puts "How would you like to play? 0, 1 or 2 players."
    puts "0 - Computer vs Computer"
    puts "1 - Person vs Computer"
    puts "2 - Person vs Person"
    mode_number = gets.strip.to_i

    if mode_number == 0 # computer vs computer
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")

    elsif mode_number == 1 #person vs computer
      puts "Who should go first? This player will be represented by \"X\"."
      puts "1 - Person"
      puts "2 - Computer"
      player_i = gets.strip.to_i
      if player_i == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      elsif player_i == 2
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      end

    elsif mode_number == 2 #person vs person
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
    end

    puts "Let's begin!"
    Game.new(player_1, player_2, Board.new).play

    puts "Would you like to play again? (Y/N)"
    play_again_input = gets.strip
    if play_again_input == "Y"
      start
    elsif play_again_input == "N"
      exit
    end
  end
end
