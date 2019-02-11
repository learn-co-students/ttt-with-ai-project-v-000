class Game
  WIN_COMBINATIONS = [[0,1,2], [0, 3, 6], [0,4,8], [2, 4, 6], [2, 5, 8], [1, 4, 7], [6, 7, 8], [3, 4, 5]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even? ? player_1 : player_2
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]] &&
        board.taken?(combo[0]+1)
     end
  end

  def draw?
    if !board.cells.include?(" ") && !won?
      true
    end
  end

  def over?
    if draw? || won?
      true
  end
end

def winner
  board.cells[won?[0]] if won?
end

def turn
  player = current_player
    index = player.move(board)
    if board.valid_move?(index)
      board.update(index, player)
      board.display
    else
      turn
    end
end

def play
  while  !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end


end
