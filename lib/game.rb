class Game
  attr_accessor :board, :game_type, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(p_1 = Players::Human.new("X"), p_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p_1
    @player_2 = p_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      self.board.taken?(combo[0] + 1) && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
    end
  end

  def full?
    self.board.full?
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      self.board.cells[combo[0]]
    end
  end

  def turn
    puts "#{current_player.token} move:"
    begin
      flag = self.board.update(current_player.move(self.board), current_player)
    end unless flag
  end

  def play
    self.board.display
    until over?
      turn
      self.board.display
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    loop do
      self.start_game
      puts "\nDo you want to play again? (Y/N)"
      input = gets.strip.downcase
      break if input != "y" && input != "yes"
    end
  end

  def self.start_game
    self.help_game_mode
    type = self.prompt_type
    case type
    when "2"
      game = self.new
    when "1"
      if self.prompt_player_token == "X"
        game = self.new(Players::Human.new("X"), Players::Computer.new("O"))
      else
        game = self.new(Players::Computer.new("X"), Players::Human.new("O"))
      end
    when "0"
      game = self.new(Players::Computer.new("X"), Players::Computer.new("O"))
    end
    game.game_type = type
    game.play
  end

  def self.prompt_type
    begin
      puts "Choose game mode:"
      game_type = gets.strip
    end until game_type == "2" || game_type == "1" || game_type == "0"
    game_type
  end

  def self.prompt_player_token
    begin
      puts "Choose X or O token:"
      input = gets.strip.upcase
    end unless input == "X" || input == "O"
    input
  end

  def self.help_game_mode
    puts "\t2 players (2)"
    puts "\t1 player (1)"
    puts "\t0 players (0)"
  end
end
