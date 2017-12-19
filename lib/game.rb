class Game

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

  attr_accessor :board, :player_1, :player_2 
  attr_reader :token

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    if won? || draw?
      return true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.find do |token|

      win_index_1 = token[0]
      win_index_2 = token[1]
      win_index_3 = token[2]

      position_1 = board.cells[win_index_1] 
      position_2 = board.cells[win_index_2] 
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return token      
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return token
      else
        false
      end
    end
  end

  def draw?
    full? and not won? 
  end

  def full?
    board.cells.all? { |token| token =="X" || token == "O" }
  end

  def winner
    if token = won?
    @board.cells[token.first]
    end
  end

  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
  end

  def turn
    player_move = current_player.move(@board)
    if board.valid_move?(player_move)
      board.update(player_move, current_player)
    else
      turn
    end
  end

  def cells=(cells)
    @cells = cells
  end

end