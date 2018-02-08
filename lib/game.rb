class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    player_1 ? self.player_1 = player_1 : self.player_1 = Players::Human.new("X")
    player_2 ? self.player_2 = player_2 : self.player_2 = Players::Human.new("O")
    board ? self.board = board : self.board = Board.new
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      win_letters = [0, 1, 2].map { |w| self.board.cells[win[w]] }
      if win_letters.all? { |w| w == "X" } || win_letters.all? { |w| w == "O" }
        return win
      end
    end
    false
  end

  def draw?
    over? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |win|
      win_letters = [0, 1, 2].map { |w| self.board.cells[win[w]] }
      if win_letters.all? { |w| w == "X" }
        return "X"
      elsif win_letters.all? { |w| w == "O" }
        return "O"
      end
    end
    nil
  end

  def turn
    position = -1
    until self.board.valid_move?(position)
      position = current_player.move(board)
    end
    self.board.update(position, current_player)
  end

  def play
    until draw? || won?
      board.display
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
      board.display
    else
      puts "Cat's Game!"
    end
  end

end
