require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
  end

  def current_player
    # binding.pry
    self.board.cells.find_all { |cell| cell == " " }.length % 2 == 0 ? @player_2 : @player_1
  end

  def over?
    self.board.cells.find_all { |cell| cell == " " }.length == 0 ? true : false
  end

  def won?
    # binding.pry
    # condition = false
    WIN_COMBINATIONS.each do |combo|
      # binding.pry
      if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
        return self.board.cells[combo[0]]
      end
    end
    false
  end

  def draw?
    over? && !won?
  end

  def winner
    # binding.pry
    if won?
      if won? == "X"
        @winner = @player_1.token
      elsif won? == "O"
        @winner = @player_2.token
      else
        @winner = nil
      end
    else
      @winner = nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    player = current_player
    move = player.move(self.board)
    if !self.board.valid_move?(move)
      turn
    else
      self.board.update(move, player)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
