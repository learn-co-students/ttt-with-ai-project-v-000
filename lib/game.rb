class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
    
 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
        board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
        board.taken?(win_combination[0]+ 1)
        win_combination
      end
    end
  end

  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won? || board.full?
  end
  
  def winner
    if token = won?
      winner = board.cells[token.first]
    end
  end
  
  def turn
    index = current_player.move(board)
    if !board.valid_move?(index)
      puts "Not a valid move."
      turn
    else
   
      board.update(index, current_player)
      board.display
    end
  end
  
  def play
    puts "Ready Player 1? Go!"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
