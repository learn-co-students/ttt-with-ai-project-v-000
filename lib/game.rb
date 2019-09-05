class Game
    extend Players
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    self.board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all?{|index| self.board.cells[index] == "X"}
        win_combination
      elsif win_combination.all?{|index| self.board.cells[index] == "O"}
        win_combination
      else
        false
      end
    end
  end

  def winner
    won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    puts "Player #{current_player.token}"
    puts "\n"
    input = current_player.move(self.board)

    if !self.board.valid_move?(input)

      turn
    else
      self.board.update(input, current_player)
      self.board.display
      puts "\n"
    end
  end

  def play
    while !over?
      turn
      sleep(1) if current_player.class.eql?(Players::Computer)
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end

class Logic

  def start_game

      collect_params(game_type)
  end

  def new_game
    puts "\n"
    puts "Would you like to play again?"
    puts "Y/n"
    response = $stdin.gets.strip.upcase
    if response.eql?("Y")
      Logic.new.start_game
    elsif response.eql?("N")
      puts "Goodbye"
      exit
    end
  end

  def greeting
    puts "Welcome to Tic Tac Toe"
    puts "\n"
    puts "****************"
    puts "\n"

  end

  def game_type
    puts "What kind of game would you like to play?"
    puts "0 player (Computer match), 1 player, or 2 player"
    type = $stdin.gets.strip.slice(/\d/).to_i
    if (0..2).include?(type)
      collect_params(type)
    else
      puts "Invalid"
      puts "\n"
      game_type
    end
  end

  def collect_params(type)
    if type == 0
      computer_v_computer
    elsif type == 1
      puts "Playing Human Vs. Computer"
      single_player(token_assign)
    else
      puts "Playing Human Vs. Human"
      human_v_human(token_assign)
    end
  end

  def token_assign
      puts "Player 1, please select a token, X sets first"
      token = $stdin.gets.strip.upcase
      if ["X","O"].include?(token)
        token
      else
        puts "\n"
        token_assign
      end
    end

  def computer_v_computer
    Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new).play
    Logic.new.new_game
  end

  def single_player(token)

    if token.upcase.eql?("X")
      Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new).play
    elsif token.upcase.eql?("O")
      Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new).play
      Logic.new.new_game
    end
  end

  def human_v_human(token)
      Game.new
      Logic.new.new_game
  end

end
