class Game
  attr_accessor :board, :player_1, :player_2, :token

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

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def turn_count
    self.board.cells.count{|token| token == "X" || token == "O"}
  end
  def current_player
    self.turn_count % 2 == 0 ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
    end
  end
  def full?
    self.board.cells.all? {|cell| cell == "X" || cell == "O"}
  end
  def draw?
    won?.nil? && full?
  end
  def over?
    draw? || won? 
  end
  def winner
    won?.each {|num| return self.board.cells[num][0]} unless won?.nil? 
  end
  def turn
    move = current_player.move(@board)
    board.valid_move?(move) ? board.update(move, current_player) : turn
    current_player
  end
  def play
    turn until over?
    puts "Cats Game!" if draw?
    puts "Congratulations #{winner}!" unless draw?
  end
  def play_cli
    turn until over?
    puts "Cats Game!" if draw?
    puts "Congratulations #{winner}!" unless draw?
  end
end