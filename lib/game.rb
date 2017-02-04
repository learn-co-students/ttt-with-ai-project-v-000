require_relative "../config/environment.rb"

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
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

  def current_player
    board.cells.select{|cell| !cell.strip.empty?}.count.even? ? player_1 : player_2
  end

  def winner
    winning_combo = WIN_COMBINATIONS.detect do |combo|
      [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]].uniq.count == 1 && !board.cells[combo[0]].strip.empty?
    end
    winning_combo.nil? ? nil : board.cells[winning_combo[0]]
  end

  def won?
    !winner.nil?
  end

  def draw?
    board.cells.all?{|cell| !cell.strip.empty?} && winner.nil?
  end

  def over?
    won? || draw?
  end

  def valid_move?(input)
    input >= 1 && input <= 9 && board.cells[input.to_i-1].strip.empty?
  end

  def turn
    position = 0
    until valid_move?(position)
      puts "#{current_player.token}'s turn."
      position = current_player.move(board).to_i
    end
    board.cells[position-1] = current_player.token
  end

  def play
    until over?
      turn
      board.display
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
