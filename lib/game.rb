require_relative '../config/monkey_patches.rb'

class Game
#=====================================properties======================================
  attr_accessor :player_1, :player_2, :board
#=====================================intialize=======================================
  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = p1
    self.player_2 = p2
    self.board = board
  end
#=====================================================================================
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
#=====================================================================================
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find{|c| board.cells[c[0]] == board.cells[c[1]] && board.cells[c[0]] == board.cells[c[2]] && board.cells[c[0]] != " "}
  end
#=====================================================================================
  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combo_char unless !won?
  end

  def turn
    move = current_player.move(board)
    sleep(0.3)
    board.valid_move?(move)? board.update(move, current_player) : current_player.class == Players::Computer ? turn : error!

    board.display
    puts "==========="
  end

  def error!
    puts "\n Invalid Move Try Again \n".colorize(color: :white, background: :red)
    sleep(0.2)
    turn
  end

  def play
    while !over? && !draw?; turn end
    if won? then puts "Congratulations #{winner}!".green elsif draw? then puts "It's Draw!!".yellow end
  end
#========================================CLI==========================================
  def win_combo_char
    board.cells[won?[0]]
  end

  def self.start
    puts "Welcome To Tic Tac Toe!".cyan
    puts "Please Enter Game Mode To Start".green
    puts "Spectator:"+" 0".green
    puts "You vs Computer:"+" 1".green
    puts "Player vs Player:"+" 2".green
    choose
  end

  def self.choose
    mode = gets.strip
    until mode == "valid"
      if mode == "0"
        mode = "valid"
        puts "COMPUTER vs COMPUTER... GAME STARTING IN 3..2..1!".cyan
        sleep(2)
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      elsif mode == "1"
        mode = "valid"
        puts "YOU vs COMPUTER... GOOD LUCK!".cyan
        sleep(2)
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif mode == "2"
        mode = "valid"
        puts "PLAYER vs PLAYER... MAY THE BEST MAN WIN!".cyan
        sleep(2.5)
        Game.new.play
      else
        puts "\n Invalid Entry Please Enter 0, 1, or 2 \n".colorize(color: :white, background: :red)
        sleep(0.3)
        self.start
      end
    end
  end



#=====================================================================================
end
