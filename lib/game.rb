class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  CORNERS = [0,2,6,8]
  CENTER = 4

  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board ||= Board.new
    @player_1 = player_1 ||= Players::Human.new("X")
    @player_2 = player_2 ||= Players::Human.new("O")
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def full?
    !board.cells.any? { |x| x == " " }
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    win = WIN_COMBINATIONS.detect do |combo|
      win_combo = []
      combo.map do |el|
        win_combo << board.cells[el]
      end
      win_combo.uniq.length == 1
    end
    win
  end

  def draw?
    self.full? && !self.won?
  end

  def winner
    if self.over?
      winner = board.cells[self.won?.first]
    end
    winner == " " ? winner = nil : winner
  end

  def turn
    puts "Please enter your move from 1 - 9:"
    if current_player == player_1
      player_move = self.current_player.move(@board.cells).to_i
      until @board.cells.map(&:to_i).include?(player_move)
        puts "invalid"
        puts "Please enter your move from 1 - 9:"
        player_move = self.player_1.move(@board.cells).to_i
      end
    elsif current_player == player_2
      player_move = 5#self.player_2.move(@board.cells).to_i
    end
    player_move
  end

  def play
  end
end
