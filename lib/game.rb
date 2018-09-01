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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      a = self.board.cells[combo[0]]
      b = self.board.cells[combo[1]]
      c = self.board.cells[combo[2]]

      if (a == b) && (b == c) && (a != " ")
        return combo
      else
        nil
      end
    end
  end

  def draw?
    return true if !!won? == false && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    # over? ? self.board.cells[won?[0]] : nil
    # binding.pry
    if combo = won?
      self.board.cells[combo[0]]
    else
      nil
    end
  end

  def start

  end

  def play
    # if !self.over?
    #   self.turn
    #   self.over?
    #   play
    # else
    #   # self.winner
    #   puts "Congratulations #{winner.token}!"
    # end
    self.turn until self.over?
    self.winner ? "Congratulations #{self.current_player.token}" : "Cats game!"
  end

  def turn
    player = self.current_player
    move = self.current_player.move(board)
    if self.board.valid_move?(move)
      self.board.update(move, player)
    else
      puts "Invalid entry received."
      turn
    end
    # self.over?
  end
end
