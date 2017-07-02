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
  
  CORNER_COMBOS = [
      [0,1,2],
      [0,3,6],
      [2,5,8],
      [6,7,8]
    ]
    
  CORNER_MOVES = [1,3,7,9]
  SIDE_MOVES = [2,4,6,8]
  
  def self.win_combo
    WIN_COMBINATIONS
  end

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
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    move = ""
    loop do
      board.display
      puts "Please enter 1 - 9: "
      move = current_player.move(board)
      break if board.valid_move?(move)
    end
    board.update(move, current_player)
  end

  def winner
    board.cells[winning_combo[0]] if won?
  end

  def won?
    combo = winning_combo
    combo.class == Array
  end

  def winning_combo
    combo = WIN_COMBINATIONS.detect do |c|
      board.cells[c[0]] == "X" && board.cells[c[1]] == "X" &&
      board.cells[c[2]] == "X" ||
      board.cells[c[0]] == "O" &&
      board.cells[c[1]] == "O" &&
      board.cells[c[2]] == "O"
    end
    combo
  end
  
  def start_game
    self.play
  end

end
