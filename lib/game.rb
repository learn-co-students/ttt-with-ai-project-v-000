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

  def winner # REFACTOR AND MAKE MORE ELEGANT PLZZZZZ
    if won?
      winning_combo = won?
      winner = board.cells[winning_combo[0]]
    else
      nil
    end
  end

  def turn
    cpm = self.current_player.move # stores the user's inputted desired move <--- calls GETS
      if board.valid_move?(cpm) # checks if the user's desired position is available
        board.update(cpm, current_player) # changes the board's space to the user's playertoken if valid
      else
        puts "invalid"
        self.turn # if the inputted desired position is not available, go back to TURN's 1st line and try for a different input
      end
  end

  def play
    self.turn
    self.over?

    self.play
  end

end #<---CLASSend
