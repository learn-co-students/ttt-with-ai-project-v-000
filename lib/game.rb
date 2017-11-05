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
    [2,4,6]
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @board = board
    @board = Board.new if @board == nil

    @player_1 = player_1
    @player_1 = Players::Human.new("X") if @player_1 == nil

    @player_2 = player_2
    @player_2 = Players::Human.new("O") if @player_2 == nil
  end

  def current_player
    if self.board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    win = WIN_COMBINATIONS.select { |x|
      self.board.cells[x[0]] == self.board.cells[x[1]] && self.board.cells[x[1]] == self.board.cells[x[2]] && self.board.cells[x[0]] != " "
    }
    if win == []
      1 == 2
    else
      win[0]
    end
  end

  def draw?
    if self.board.full? == true && self.won? == false
      1 == 1
    else
      1 == 2
    end
  end

  def over?
    if self.won? != false || self.draw? == true
      1 == 1
    else
      1 == 2
    end
  end

  def winner
    winner = nil
    winner = self.board.cells[self.won?[0]] if self.won? != false
    winner
  end

  def turn
    x = self.current_player.move(board)
    if self.board.valid_move?(x) == false
      self.turn
    elsif self.board.valid_move?(x) == true
      self.board.update(x, self.current_player)
    end
    self.board.display
  end

  def play
    self.turn until self.over? == true
    if self.winner == "X"
      puts "Congratulations X!"
    elsif self.winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end


end
