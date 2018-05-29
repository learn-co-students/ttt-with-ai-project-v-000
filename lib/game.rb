require 'pry'
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
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = self.board.turn_count
    turn % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |winner|
      # binding.pry
      if winner.all? {|index| self.board.taken?(index.to_i + 1)}
        position1 = self.board.cells[winner[0]]
        position2 = self.board.cells[winner[1]]
        position3 = self.board.cells[winner[2]]

        if position1 == position2 && position1 == position3
          return winner
        end
      end
    end
    return false
  end

  def draw?
    if self.board.full? && !self.won?
      return true
    end
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    winner = self.won?
    winner ? self.board.cells[winner[0]] : nil
  end

  def turn
    input = ""
    player = self.current_player
    until self.board.valid_move?(input)
      input = player.move(self.board)
    end
    self.board.update(input, player)

    return input
  end

  def play
    puts "Please enter 1-9:"

    while !self.over?
      self.turn
    end

    if draw?
      puts "Cat's Game!"
    else
      winner = self.winner
      puts "Congratulations #{winner}!"
    end
  end
end
