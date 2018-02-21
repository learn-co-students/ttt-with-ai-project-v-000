class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :players, :start_player

  WIN_COMBINATIONS = [
    [2,5,8],
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [6,4,2]]

  @@results = []

  def self.results
     @@results
  end

  def save
    Game.results << winner
  end

  def self.war
    @@war
  end

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] != " " &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
     board.cells[won?[0]] if won?
  end

  def turn
    move = current_player.move(board)
    if !board.valid_move?(move)
      turn
    else
      board.update(move, current_player)
      board.display if !Game.war
    end
  end

  def play
    board.display
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    replay   # breaks the 04_game_spec test if it's not removed
  end

  def replay
    puts "Would you like to play again? (Y/n)"
    input = gets.strip.downcase
    replay unless ["y","n"].include?(input)
    input == "y" ? start : exit
  end

  def start
    @@war = false
    puts "What kind of game would you like to play? (0/1/2)-player"    # /s can be converted to 0 with to_i
    @players = gets.strip
    wargames if players == "wargames"
    start unless ["0", "1", "2"].include?(players)
    player_names
    starting_player
    game_setup
  end

  def war_play
    turn until over?
    save
  end

  def wargames
    @@war = true

    Game.new(Players::Computer.new("X"), p2 = Players::Computer.new("O")).war_play until Game.results.length == 100

    x_wins = Game.results.count("X")
    o_wins = Game.results.count("O")
    draws = Game.results.count(nil)

    x_wins = "no" if x_wins = 0
    o_wins = "no" if o_wins = 0

    puts "There were #{x_wins} \"X\" wins, #{o_wins} \"O\" wins, and #{draws} draws out of #{Game.results.length} game(s)."
    replay
  end

  def player_names
     case players
     when "0"
       ["Computer 1", "Computer 2"]
     when "1"
       ["Player", "Computer"]
     when "2"
       ["Player 1", "Player 2"]
     end
   end

  def starting_player
    puts "Who should go first and be \"X\"? #{player_names[0]}(1) or #{player_names[1]}(2)?"
    @start_player = gets.strip.to_i
    starting_player unless [1,2].include?(start_player)
  end

  def game_setup
    case players
    when "0"
      p1 = Players::Computer.new("X")
      p2 = Players::Computer.new("O")
    when "1"
      if start_player == 1
        p1 = Players::Human.new("X")
        p2 = Players::Computer.new("O")
      else
        p1 = Players::Computer.new("X")
        p2 = Players::Human.new("O")
      end
    when "2"
      p1 = Players::Human.new("X")
      p2 = Players::Human.new("O")
    end

    puts start_player == 1 ? "#{player_names[0]} is starting against #{player_names[1]}." : "#{player_names[1]} is starting against #{player_names[0]}."
    Game.new(p1, p2).play
  end
end
