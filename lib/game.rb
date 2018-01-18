class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.any? do |wc|
      board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X" ||
      board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      WIN_COMBINATIONS.select do |wc|
        if board.cells[wc[0]] == "X" && board.cells[wc[1]] == "X" && board.cells[wc[2]] == "X"
          return "X"
        elsif board.cells[wc[0]] == "O" && board.cells[wc[1]] == "O" && board.cells[wc[2]] == "O"
          return "O"
        end
      end
    end
  end

  def turn
    playermove = self.current_player.move(@board)
    @board.update(playermove, self.current_player)
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  
end
