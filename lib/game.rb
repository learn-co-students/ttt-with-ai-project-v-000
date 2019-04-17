require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [ 0, 1, 2 ],
    [ 3, 4, 5 ],
    [ 6, 7, 8 ],
    [ 0, 3, 6 ],
    [ 1, 4, 7 ],
    [ 2, 5, 8 ],
    [ 0, 4, 8 ],
    [ 6, 4, 2 ],
  ]

  def initialize(p1 = Players::Human.new("X") , p2 = Players::Human.new("O"), bd = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = bd
  end

  def current_player
    count = board.turn_count
    count.even? ? player_1 : player_2
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "# this is just pulling whatever matches each other - " " etc. XXXXXXFIX
      end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner #this is broken - if there's no winner - it'll return "" instead of nil
    if won?
      winning_combo = won?
      winner = board.cells[winning_combo[0]]
    end
  end

end #<---CLASSend
