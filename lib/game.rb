require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  @@winners = Array.new

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @@winners = Array.new
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
    end
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def over?
    won? || draw? || board.full? ? true : false
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    else
      board.update(input, current_player)

      n = @@winners.size + 1

      if n < 10
        n = "00#{n}"
      elsif n.between?(10, 99)
        n = "0#{n}"
      else
        n
      end

      puts " "
      puts "=GAME: #{n}="
      board.display
      puts "==TURN: #{board.turn_count}=="
      puts " "
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @@winners << winner
    elsif draw?
      puts "Cat's Game!"
      @@winners << "draw"
    end
  end

  def self.games_won
    x = @@winners.count("X")
    o = @@winners.count("O")
    border = "=" * 22

    if x >= 10 || o >= 10
      border << "="
    elsif x >= 10 && o >= 10
      border << "=="
    else
      border
    end

    puts " "
    puts border
    puts "X wins: #{x} | O wins: #{o}"
    puts border
  end
end

#LOSE               WIN
#["X", "O", "X"]    ["X", "O", "X"]
#["O", "X", "X"]    ["O", "O", "X"]
#["O", "X", "O"]    ["O", "X", "X"]
