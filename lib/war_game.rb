require 'pry'

class War_Game
  attr_accessor :board, :player_1, :player_2

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

  @@all_winners = {"X": 0, "O": 0, "Draw": 0}

  def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def current_player
    @board.turn_count.even?? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(board).to_i
    remember_player = current_player.token
    if @board.valid_move?(input)
      @board.cells[input - 1] = current_player.token
      @board.display
      puts "Computer player #{remember_player} has selected position #{input}."
    else
      turn
    end
  end

  def play

    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      if winner == "X"
        @@all_winners[:X] += 1
      elsif winner == "O"
        @@all_winners[:O] += 1
      end
    elsif draw?
      puts "Cat's Game!"
      @@all_winners[:Draw] += 1
    end

  end

  def self.all
    @@all_winners
  end

end
