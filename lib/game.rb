require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

# A game has one Board through its board property.
# A game has two Players stored in a player_1 and player_2 property.
# Properties - getters/setters

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

# Initialize: 'defaults to two human players, X and O, with am empty board'
# Player: def initialize(token)
# expect(game.player_1).to be_a(Player::Human)
# expect(game.player_1.token).to eq("X")
# expect(game.player_2).to be_a(Player::Human)
# expect(game.player_2.token).to eq("O")
# expect(game.board.cells).to match_array(Array.new(9, " "))

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1 # meaning @player_1 goes next
    else
      @player_2
    end
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|location| @board.cells[location] == "X"} || 
        win_combination.all? {|location| @board.cells[location] == "O"}
        true
      end
    end
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def winner # messy, but don't know how to fix
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|location| @board.cells[location] == "X" }
        return "X"
      elsif win_combination.all? {|location| @board.cells[location] == "O" }
        return "O"
      end
    end
  end

  # #turn 
  # it 'makes valid moves'
  # allow($stdout).to receive(:puts)
  # expect(game.player_1).to receive(:gets).and_return("1")
  # game.turn
  # Game turn asks for input again after a failed validation

  def turn
    this_move = current_player.move(board)
    # initializing player_1/player_2 to be Player::Human lets .move be called
    if @board.valid_move?(this_move)
      #@board.display
      puts "\n\n\n"
      puts "Turn count is: #{@board.turn_count + 1}"
      @board.update(this_move, current_player)
      # board.update(this_move, self.current_player)
      @board.display
    else
      turn
    end

  end

  # play
  # 'asks for players input on a turn of the game' - #turn
  # allow($stdout).to receive(:puts) - #turn
  # allow(game).to receive(:over?).and_return(false, true) - until over?
  # 'checks if the game is over after every turn' - until over?
  # 'plays the first turn of the game' - #turn
  # 'plays the first few turns of the game' - #turn
  # 'checks if the game is won after every turn' - until over?
  # 'checks if the game is draw after every turn' - until over?
  # 'stops playing if someone has won' - #won?
  # 'congratulates the winner X or winner O' - #won? / #winner
  # 'stops playing in a draw' & prints Cats Game - #draw?


  def play
    @board.display
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end

 end