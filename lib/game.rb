require 'pry'
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
    self.board.cells.find_all { |cell| cell == " " }.length % 2 == 0 ? @player_2 : @player_1
  end

  def over?
    self.board.cells.find_all { |cell| cell == " " }.length == 0 || won?
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      [self.board.cells[combo[0]], self.board.cells[combo[1]], self.board.cells[combo[2]]].all? {|position| position == "X"} ||
      [self.board.cells[combo[0]], self.board.cells[combo[1]], self.board.cells[combo[2]]].all? {|position| position == "O"}
    end
  end

  def draw?
    self.board.cells.find_all { |cell| cell == " " }.length == 0  && !won?
  end

  def winner
    if won?
      if board.cells[won?[0]] == "X"
        @winner = @player_1.token
      else board.cells[won?[0]] == "O"
        @winner = @player_2.token
      end
    end
  end

  def turn
    self.board.display
    puts "Please enter 1-9:"
    player = current_player
    move = player.move(self.board)
    self.board.display
    if !self.board.valid_move?(move)
      puts "You tried to move to an occupied space, #{move}, please select another."
      turn
    else
      self.board.update(move, player)
    end
  end

  def play
    until over? || draw? || won?
      turn
    end
    if won?
      self.board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
