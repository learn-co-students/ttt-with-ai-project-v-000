require 'pry'
class Game
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
    ]
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = nil, player_2 = nil, board = nil)
    player_1 == nil ? @player_1 = Players::Human.new("X") : @player_1 = player_1
    player_2 == nil ? @player_2 = Players::Human.new("O") : @player_2 = player_2
    board == nil ? @board = Board.new : @board = board
  end

  def current_player
    @board.cells.count(" ").odd? ? @player_1 : @player_2
  end
  
  def won? 
    WIN_COMBINATIONS.detect {|win| 
      @board.cells[win[0]] == "X" && 
      @board.cells[win[1]] == "X" && 
      @board.cells[win[2]] == "X" ||
      @board.cells[win[0]] == "O" && 
      @board.cells[win[1]] == "O" && 
      @board.cells[win[2]] == "O"
      }
  end
  
  def draw?
    won? == nil && @board.full?
  end
  
  def over? 
    won? != nil || draw?
  end
  
  def winner 
    won?.nil? ? nil : @board.cells[won?[0]]
  end

  def turn
    valid = false
    until valid == true
      pos = current_player.move(@board)
      valid = @board.valid_move?(pos)
    end
    @board.update(pos, current_player.token)
  end

  def play
    until over?
      turn
      @board.display
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
 
  def start
    puts "Welcome to Tic-Tac-Toe!"
    puts "Select a game:"
    puts " - Make the computer play itself, click '0'."
    puts " - Play versus the computer, click '1'."
    puts " - Play against a friend, click '2'."
    @game_type = gets.chomp.to_i
    case @game_type 
      when 0 #computer vs computer
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
        play
      when 1 #player vs computer
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
        play
      when 2 #player vs player
        puts "Great! Who wants to go first and be 'X'?"
        play
    end
  end
end











