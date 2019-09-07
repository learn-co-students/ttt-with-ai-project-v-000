require'pry'
class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # binding.pry
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      winners = []
      winning_combo.each do |position|
        winners<<board.cells[position]
      end
      winners == ["X","X","X"] || winners == ["O","O","O"]
    end
  end

  def draw?
    board.full?&&!won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    user_input = current_player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
  end
end
