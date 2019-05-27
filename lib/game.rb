class Game
  attr_accessor :player_1, :player_2, :board
  attr_reader :winner

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def self.main_menu
  puts "If you want to play against a computer, please type 1"
  puts "If you want to play against another person, please type 2"
  puts "If you would like the computer to play itself, please type 0"
  puts "If you would like to exit, please type 'exit'"

  input = gets.strip


  case input
    when "1"
      game_play_1
    when "2"
      game_play_2
    when "0"
      game_play_0
    when "exit"
      puts "Goodbye!"
      exit
    end
  end

    def self.game_play_1
      puts "Do you want to go first and be 'X'?"
      x_or_o = gets.strip.to_s
      if x_or_o == "yes" || x_or_o == "y"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        game.play
      else
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        game.play
      end
    end


    def self.game_play_2
      puts "First player is X"
      game = Game.new
      game.play
    end

    def self.game_play_0
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
    end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    true if draw? || won?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !@board.valid_move?(current_move)
      puts "You have made an invalid move!"
      turn
    else
    puts "#{player.token} has moved to slot #{current_move}\n"
    puts "Turn: #{@board.turn_count+1}"
    @board.turn_count+1
    @board.update(current_move,player)
    @board.display
    puts "#{current_player.token}'s turn!\n"
  end
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
end
