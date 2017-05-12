class Game

  attr_accessor :board, :player_1, :player_2

 WIN_COMBINATIONS = [
    [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    value = board.turn_count
    if value % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def over?
    !self.board.cells.include? " "
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
      self.board.taken?(combo[0]+1)
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    if won?
      return self.board.cells[won?[0]]
    end
  end

  def turn
    current_player.board = board
    number = current_player.input
    if board.valid_move?(number)
      board.update(number, current_player)
    else
      turn
    end
  end

  def play
    until won? || draw?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end



end
