
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

    need_input = true
    while need_input do
      inp = current_player.move(b)

      return nil if inp.downcase == "exit"

      inp = inp.to_i

      if b.cells[inp].strip == ""
        b.cells[inp] = current_player.token
        need_input = false
      end
    end
    inp
  end

end
