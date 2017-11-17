require 'pry'

class Game
  include Rules
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    board.display
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    board.display
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
    return 0 if draw?
    return 1 if winner == "X"
    return 2 if winner == "O"
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? (Enter 0, 1, or 2?)"
    input = gets.strip

    case input

    when "0"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

    when "1"
      puts "Who goes first? p(layer)/c(omp)"
      first = gets.strip
      puts "X or O?"
      piece = gets.strip.upcase
      piece == "X" ? other_piece = "O" : other_piece = "X"
        if first == "p"
          new_game = Game.new(Players::Human.new(piece), Players::Computer.new(other_piece))
        else
          new_game = Game.new(Players::Computer.new(other_piece), Players::Human.new(piece))
        end

    when "2"
      puts "Player 1 is X or O?"
      piece = gets.strip.upcase
      piece == "X" ? other_piece = "O" : other_piece = "X"
      new_game = Game.new(Players::Human.new(piece), Players::Human.new(other_piece))

    when "wargames"
      draw = 0
      player_1 = 0
      player_2 = 0
      10.times do
        new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        case new_game.play
        when 0
          draw += 1
        when 1
          player_1 +=1
        when 2
          player_2 += 1
        end
        puts "Player 1: #{player_1}"
        puts "Player 2: #{player_2}"
        puts "Draw: #{draw}"
        puts ""
      end
      puts "Play again? (y/n)"
      input = gets.strip.downcase
      start if input == "y"
      exit if input == "n"

    when "exit"
      exit

    else
      start
    end

    new_game.play
    puts "Play again? (y/n)"
    input = gets.strip.downcase
    start if input == "y"
    exit if input == "n"
  end
end
