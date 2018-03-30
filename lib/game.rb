require 'pry'
class Game
  attr_accessor :board
  attr_accessor :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],  #1
    [3,4,5], #2
    [6,7,8], #3
    [0,3,6], #4
    [0,4,8],  #5
    [1,4,7],  #6
    [2,5,8],  #7
    [2,4,6]  #8 / 8 win combos
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count%2 == 0 ? @player_1 : @player_2
  end

  def over?
    board.full? #|| won?
  end

  def won?
    win_combo = false #default if there are no win_combos
    # board.cells[x] compares to win_combos , and if win_combos[z] all == "x", then return the combo
    WIN_COMBINATIONS.each do |numarray|
      if @board.cells[numarray[0]] =="X" && @board.cells[numarray[1]] == "X" && @board.cells[numarray[2]] == "X" || @board.cells[numarray[0]] == "O" && @board.cells[numarray[1]] == "O" && @board.cells[numarray[2]] == "O"
        win_combo = numarray
      end
    end
    win_combo #default false or win_combo if found
  end

  def draw?
    won? == false && @board.full? == true
  end

  def winner
    winner = nil
    WIN_COMBINATIONS.each do |numarray|
      if @board.cells[numarray[0]] =="X" && @board.cells[numarray[1]] == "X" && @board.cells[numarray[2]] == "X" || @board.cells[numarray[0]] == "O" && @board.cells[numarray[1]] == "O" && @board.cells[numarray[2]] == "O"
        winner = @board.cells[numarray[0]]
      end
    end
    winner
  end

  def turn
    input = current_player.move(board) until @board.valid_move?(input)
    @board.update(input, current_player)
  end

  def play
    until self.won? || self.draw? || self.over?
      self.turn
    end
    if draw?
      puts "Cat's Game!"
    else
    puts "Congratulations #{self.winner}!"
    end
  end

end
