class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
      #X gets odd moves
      #O gets even moves

      self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[1]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    puts "It is #{self.current_player.token}'s turn!"
    puts "Please enter 1-9:"
    pos = self.current_player.move(self.board)

    if board.valid_move?(pos)
      board.update(pos, self.current_player)
      board.display
      else turn
    end
  end

  def play
    while !self.over?
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
      self.winner
    elsif self.draw?
      puts "Cat's Game!"
      "Cat's Game!"
    end
  end

end
