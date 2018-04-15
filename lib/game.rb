require 'pry'
class Game

  extend Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    self.board.full? ? true : false
  end

  def won?
    number_of_O = self.board.cells.select {|cell| cell == "O"}
    number_of_X = self.board.cells.select {|cell| cell == "X"}
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if self.board.full?
        position_1 == "X" && position_2 == "X" && position_3 == "X"
      else
        (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      end
    end
  end

  def draw?
    # if self.won? || !self.board.full?
    #   binding.pry
    #   false
    # else
    #   binding.pry
    #   true
    # end
    self.board.full? && !self.won?
  end

  def winner
    if self.won? != nil
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    current_player = self.current_player
    user_input = current_player.move(self.board)
    while !self.board.valid_move?(user_input)
      "invalid"
      user_input = current_player.move(self.board)
      # self.turn
    end
    self.board.update(user_input, current_player)
    user_input
  end

  def play
    while !self.over?
      if self.won?
        puts "Congratulations #{self.winner}!"
        break
      end
      self.turn
    end
    # binding.pry
    if self.draw?
      puts "Cat's Game!"
    end
  end

  def start
  end

end
