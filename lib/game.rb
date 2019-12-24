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
    (self.draw? || self.won?) ? true : false
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
    if self.won? || !self.board.full?
      false
    else
      true
    end
  end

  def winner
    if self.won? != nil
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    current_player = self.current_player

    puts "#{current_player.token}'s turn"
    self.board.display

    user_input = current_player.move(self.board)

    while !self.board.valid_move?(user_input)
      "invalid"
      puts "invalid move!"
      user_input = current_player.move(self.board)
    end

    self.board.update(user_input, current_player)

    self.board.display

    user_input
  end

  def play
    while !self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
      puts "Congratulations #{self.winner}!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe with AI!"
    puts "Please select what kind of game do you want to play, input number of players (0 or 1 or 2): "

    number_of_player = gets.strip.to_i

    while !number_of_player.between?(0, 2)
      puts "Please select what kind of game do you want to play, input number of players (0 or 1 or 2):"
      number_of_player = gets.strip.to_i
    end

    if number_of_player == 0
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      self.play
    elsif number_of_player == 1
      puts "Who should go first and be 'X', player 1 is human player, player 2 is computer player, input player number (1 or 2)"
      first_player = gets.strip
      if first_player == "1"
        self.player_1 = Players::Human.new("X")
        self.player_2 = Players::Computer.new("O")
        self.play
      elsif first_player == "2"
        self.player_1 = Players::Computer.new("X")
        self.player_2 = Players::Human.new("O")
        self.play
      end
    elsif number_of_player == 2
      self.play
    end
  end

end
