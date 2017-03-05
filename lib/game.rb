class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
    @board = board if board
  end

  def current_player
    x_count = self.board.cells.count {|cell| cell == "X"}
    o_count = self.board.cells.count {|cell| cell == "O"}
    if x_count > o_count
      return @player_2
    else
      return @player_1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if ((self.board.cells[win_combination[0]]) == (self.board.cells[win_combination[1]])) && ((self.board.cells[win_combination[1]]) == (self.board.cells[win_combination[2]]))
        return true
      end
    end
    return false
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    if self.board.cells.count("X") > self.board.cells.count("O")
      return "X"
    elsif self.board.cells.count("O") > self.board.cells.count("X")
      return "O"
    else
      nil
    end
  end

  def play
    turns = 0
    while turns < 9
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      elsif over?
        break
      else
        turn
      end
      turns += 1
    end
  end

  def turn
    location = self.current_player.move until self.board.valid_move?(location)
    self.board.update(location, current_player)
  end

  def over?
    true if draw? || won? && self.board.full?
  end

end
