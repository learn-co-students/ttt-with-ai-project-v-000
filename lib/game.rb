class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      #non are empty
      (!combo.any?{|e| @board.cells[e] == " "}) &&
      #they are all the same
      combo.collect{|e| @board.cells[e]}.uniq.count == 1
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    WIN_COMBINATIONS.collect do |combo|
      (!combo.any?{|e| @board.cells[e] == " "}) && combo.collect{|e| @board.cells[e]}.uniq.count == 1 ? @board.cells[combo[0]] : nil
    end.compact[0]
  end

  def turn
    pos = "invalid"
    until @board.valid_move?(pos) do
      pos = current_player.move(@board.cells)
    end
    @board.update(pos, current_player)
    @board.display
  end

  def play
    until draw? || won? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
