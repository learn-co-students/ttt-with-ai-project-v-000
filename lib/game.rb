require 'pry'
class Game

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

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1
      @player_1 = player_1
    else
      @player_1 = Players::Human.new("X")
    end
    if player_2
      @player_2 = player_2
    else
      @player_2 = Players::Computer.new("O")
    end
    if board
      @board = board
    else
      @board = Board.new
    end
  end

  def board=(arg)
    @board = arg
  end

  def board
    @board
  end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_1
    @player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def player_2
    @player_2
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    if self.board.full? || self.won?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"
        return true
      elsif self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"
        return true
      end
    end
    false
  end

  def draw?
    if self.board.full? && !self.won?
        true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"
        return "X"
      elsif self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"
        return "O"
      end
    end
    nil
  end

  def turn
    current_turn = self.board.turn_count + 1

    if current_turn.odd?
      current_player = self.player_1
    else
      current_player = self.player_2
    end

    requested_move = "invalid"

    while requested_move == "invalid"
      requested_position = current_player.move(board)
      if self.board.valid_move?(requested_position)
        requested_move = "valid"
        self.board.update(requested_position, current_player)
      end
    end
  end

  def play
    while !self.over?
      self.board.display
      self.turn
      self.draw? #<---- checking for a draw at this point is pointless, but the tests want it
      #self.over? #<---- this line baffles me, this is the one that made the draw? test not hang, I am leaving this for my own reference should I ever have to look at this code again
    end

    self.board.display

    if won?
      puts "Congratulations #{self.winner}!"
      return self.winner
    else
      puts "Cats Game!"
      return "draw"
    end
  end
end
