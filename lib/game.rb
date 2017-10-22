require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  @@stats = {player_1: 0, player_2: 0, draws: 0}

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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[1]] == self.board.cells[win_combo[2]] && self.board.taken?((win_combo[0] + 1).to_s)
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    !won? && self.board.full?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(self.board)
    if(self.board.valid_move?(input))
      self.board.update(input, current_player)
      puts ""
      puts "###########"
      self.board.display
      puts "###########"
      puts ""
    else
      puts "invalid move"
      turn
    end
  end

  def play
    puts ""
    puts "###########"
    self.board.display
    puts "###########"
    puts ""
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      if winner == player_1.token
        self.class.stats[:player_1] += 1
      else
        self.class.stats[:player_2] += 1
      end
    else
      puts "Cats Game!"
      self.class.stats[:draws] += 1
    end
  end

  def self.stats
    @@stats
  end

  def self.reset_stats
    @@stats = {player_1: 0, player_2: 0, draws: 0}
  end
end
