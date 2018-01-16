require_relative './players/human.rb'
class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      check = combo.collect {|position| self.board.cells[position]}
      if check.all? {|token| token == player_1.token}
        winner = combo
      elsif check.all? {|token| token == player_2.token}
          winner = combo
      end
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    player = current_player
    puts "Player #{player.token}, it is your turn."
    move = player.move(self.board)
    if !self.board.valid_move?(move)
      turn
    else
      self.board.update(move, player)
      self.board.display
    end
  end

  def play
    while !over?
      self.turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    player_count = nil
    while !["0", "1", "2"].include?(player_count)
      puts "Would you like to play 0, 1, or 2 player?"
      player_count = gets.strip
    end
    if player_count == "0"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
    elsif player_count == "1"
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
    elsif player_count == "2"
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
    else
      self.start
    end
    game = self.new(player_1, player_2, Board.new)
    game.board.display
    game.play
  end

end
