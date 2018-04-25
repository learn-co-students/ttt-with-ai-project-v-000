
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = p1
    self.player_2 = p2
  end

  def current_player
    b = self.board
    t = b.turn_count

    t % 2 == 0 ? player_1 : player_2
  end

  def won?
    c = self.board.cells
    w = WIN_COMBINATIONS

    rtn = nil
    (0..7).each do |idx|
      e = w[idx]
      rtn = e if ((c[e[0]] == c[e[1]]) && (c[e[1]] == c[e[2]]) && (c[e[0]].strip != ""))
    end

    rtn
  end

  def draw?
    self.board.turn_count > 8 && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    w = won?

    return nil if !!! w

    self.board.cells[w[0]]
  end

  def turn
    b = self.board

    ret = nil
    need_input = true
    while need_input do
      inp = one_turn
      need_input = (inp == "invalid")
    end

    inp
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def win_combo
    WIN_COMBINATIONS
  end

private

  def one_turn
    b = self.board

    inp = current_player.move(b)
    puts "Player Input: " + inp
    return "invalid" if !b.valid_move?(inp)
    b.cells[inp.to_i - 1] = current_player.token
  end

end
