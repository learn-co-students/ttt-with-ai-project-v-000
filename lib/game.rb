# require 'players'

class Game
  # extend Players
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0 
      @player_1
    else
      @board.turn_count % 2 == 1
        @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if board.cells[combination[0]] == "X" && board.cells[combination[1]] == "X" && board.cells[combination[2]] == "X" || board.cells[combination[0]] == "O" && board.cells[combination[1]] == "O" && board.cells[combination[2]] == "O" 
        return combination
      end
    end
    return false
  end
  
  def self.start
    Game.new
  end
  
  def draw?
    if board.full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw? || board.full?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    end
  end
  
  def turn
    current_move = current_player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move, current_player)
      board.display
    else
      puts "invalid move"
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if draw?
        puts "Cat's Game!"
    else
        puts "Congratulations #{winner}!"
    end
  end
  
  
  
end
