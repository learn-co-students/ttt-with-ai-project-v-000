class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row win
    [3, 4, 5], #middle row win
    [6, 7, 8], #bottom row win
    [0, 3, 6], #first column win
    [1, 4, 7], #second column win
    [2, 5, 8], #third column win
    [0, 4, 8], #first diagonal win
    [2, 4, 6] #second diagonal win
  ]

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if @board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] =="X"
        return win
      elsif @board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] =="O"
        return win
      else
        false
      end
    end
  end

  def draw?
    !self.won? && @board.full?
  end

  def winner
    WIN_COMBINATIONS.detect do |win|
      if @board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] =="X"
        return "X"
      elsif @board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] =="O"
        return "O"
      else
        false
      end
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #Game class end
