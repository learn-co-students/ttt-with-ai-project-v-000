require 'pry'

class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[0]] != " " ? combo : nil
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def winner
    won? ? self.board.cells[won?.first] : nil
  end

  def turn
    move = current_player.move(self.board)
    if !board.valid_move?(move)
      turn
    else
      self.board.update(move, current_player)
    end
    self.board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def self.start
    puts "Please enter the number of players. 0/1/2"
    players = gets.strip
    num_of_players unless valid_players?(players)
    tokens = choose
    if players == '0'
      Game.new(Player::Computer.new(tokens[0]), Player::Computer.new(tokens[1]))
    elsif players == '1'
      Game.new(Player::Human.new(tokens[0]), Player::Computer.new(tokens[1]))
    elsif players == '2'
      Game.new(Player::Human.new(tokens[0]), Player::Human.new(tokens[1]))
    else
      start
    end
  end

  def self.valid_players?(input)
    input == '0' || input == '1' || input == '2'
  end

  def self.choose
    tokens = []
    puts "Choose X or O for player 1!"
    input = gets.strip
    if input.upcase == 'X'
      tokens[0] = 'X'
      tokens[1] = 'O'
    elsif input.upcase == 'O'
      tokens[0] = 'O'
      tokens[1] = 'X'
    else
      choose
    end
    tokens
  end

end
