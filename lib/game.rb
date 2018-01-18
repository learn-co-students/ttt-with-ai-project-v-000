require "pry"

class Game

  attr_accessor :board, :player_1, :player_2

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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn_count
    @board.cells.count{|cell| cell == "O" || cell == "X"}
  end

  def current_player
    self.turn_count.even? ? player_1 : player_2
  end

  def ganador?(token)
   token if WIN_COMBINATIONS.any? {|combos| combos.all? {|positions| @board.cells[positions] == token}}
  end

  def winner
    ganador?("X") || ganador?("O")
  end

  def draw?
    won? == nil && @board.full? == true
  end

  def over?
    draw? == true ||  won? != nil
  end

  def won?
    WIN_COMBINATIONS.detect {|combos| combos.all? {|positions| @board.cells[positions] == self.winner}}
  end

  def turn
    cell = self.current_player.move(self.board.cells)
    system('clear')
    while self.board.valid_move?(cell) == false
      self.board.display
      puts "It is not possible to move to that square"
      cell = self.current_player.move(self.board.cells)
      system('clear')
    end
    self.board.update(cell, self.current_player)
    self.board.display
  end

  def play
    system('clear')
    puts "Welcome to Tic Tac Toe!"
    self.board.display
    until over?
      self.turn
    end
    draw? ? (puts "Cat's Game!") : (puts "Congratulations #{self.winner}!")
  end

end
