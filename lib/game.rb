require 'pry'

class Game

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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=nil, player_2=nil, board=nil)
    @board    = board ||= Board.new
    @player_1 = player_1 ||= Players::Human.new("X")
    @player_2 = player_2 ||= Players::Human.new("O")
  end

  def self.start
    puts "Welcome to Tic Tac Toe with AI!"
    puts "Do you want a game with 0, 1, or 2 player(s)?"
    player_count = gets.strip.to_i

    if player_count == 0
      puts "The computer is playing itself:"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
      board = Board.new
      game = self.new(player_1, player_2, board)
      game.play
    elsif player_count == 1
      puts "who should go first and be 'X', you (#1) or the computer (#2)?"
      first_player = gets.strip.to_i
      if first_player == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
        board = Board.new
        game = self.new(player_1, player_2, board)
        game.play
      else
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
        board = Board.new
        game = self.new(player_1, player_2, board)
        game.play
      end
    elsif player_count == 2
      puts "player 1 will go first and be 'X':"
      game = self.new
      game.play
    else
      puts "Invalid number of players, input 0, 1, or 2. Start again!"
    end
    if game.over?
      puts "Do you want to play again (#1) or exit (#2)"
      play_or_exit = gets.strip.to_i
      if play_or_exit == 1
        Game.start
      elsif play_or_exit == 2
        puts "Thanks for playing, good bye!"
        exit
      end
    end
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if (board.taken?(combo[0] + 1) &&
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]])
        return combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo[0]]
    end
  end

  def turn
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
      puts board.turn_count
    else
      puts "invalid"
      turn
    end
  end

  def play
    until over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
