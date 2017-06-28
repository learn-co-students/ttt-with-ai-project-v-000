require "pry"
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def play
    while !over?
      self.turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    move = ""
    loop do
      puts "Please enter 1 - 9: "
      move = current_player.move(board)
      break if board.valid_move?(move)
    end
    board.update(move, current_player)
  end

  def winner
    if won?
      win = WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" &&
        board.cells[combo[2]] == "X" ||
        board.cells[combo[0]] == "O" &&
        board.cells[combo[1]] == "O" &&
        board.cells[combo[2]] == "O"
      end
    board.cells[win[0]]
    else
      nil
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" &&
      board.cells[combo[2]] == "X" ||
      board.cells[combo[0]] == "O" &&
      board.cells[combo[1]] == "O" &&
      board.cells[combo[2]] == "O"
    end
  end

end
