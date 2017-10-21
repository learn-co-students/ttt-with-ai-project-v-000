require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |x|
      x.all? { |i| self.board.cells[i] == "X" } || x.all? { |i| self.board.cells[i] == "O" }
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.board.cells[won?[0]] if won?
  end

  def turn
    puts "\n#{self.board.display}\n"
    puts "\nPick a move 1-9:"
    pick = current_player.move(@board)
    if board.valid_move?(pick)
      self.board.update(pick, current_player)
    else
      puts "That is an invalid move. Please pick another move."
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      puts "#{self.board.display}"
    elsif draw?
      puts "Cats Game!"
    end
  end

  WIN_COMBINATIONS = [

    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

end