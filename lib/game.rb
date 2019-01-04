class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

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

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{ |x| board.cells[x] == "X"} || combo.all?{ |o| board.cells[o] == "O"}
        return combo
      end
    end
    false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
      puts "Congratulations #{winner}!"
    end
  end


end
