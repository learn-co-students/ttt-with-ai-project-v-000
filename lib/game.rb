require 'pry'
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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.cells[combination[0]] != " "
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw? || @board.full?
  end

  def winner
    if  winning_combination = won?                        #assigns winning array [x, y, z] to var
    @board.cells[winning_combination[0]]
    end  #returns token in 0 index of winning array
  end

  # def swap_player
  #   if player_1 == current_player
  #     player_1.move
  #   else player_2.move
  #   end
  # end

  def turn
    puts "Please enter your desired position from 1-9, Player #{current_player.token}"
    input = current_player.move(board)
    @board.position(input)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
      input
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts  "Congratulations #{winner}!"
    elsif  draw?
      puts "Cat's Game!"
    end
  end

  def start
  puts "Welcome to Julie & Mel's Tic Tac Toe"

  ####Prompt the user for what kind of game they want to play, 0,1, or 2 player.
  puts "How many players: 0, 1, or 2?"
  input = gets.strip.to_i
  if input == 0 #init 2 computer players
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
  elsif input == 1 #init 1 human/1 computer player, ask for token
    puts "Would you like to be X or O?"
    input = gets.strip.upcase
      if input == "X"
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      elsif input == "O"
        player_1 = Players::Human.new("O")
        player_2 = Players::Computer.new("X")
      else
        puts "Please enter X or O"
      end
  elsif input ==  2 #init 2 human players, ask for token
    puts "Would Player 1 like to be X or O?"
    input = gets.strip.upcase
      if input == "X"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      elsif input == "O"
        player_1 = Players::Human.new("O")
        player_2 = Players::Human.new("X")
      else
        puts "Please enter X or O"
      end
  else
    puts "Please enter valid number of players: 0, 1, or 2"
  end

  new_game = Game.new(player_1, player_2, board = Board.new)

  until new_game.over?
    new_game.play
  end
end




end
