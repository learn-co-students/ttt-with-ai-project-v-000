require 'players'

class Game
  extend Players
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.cells.count("X") == 1 && board.cells.count("O") == 1
      return player_1
    elsif board.cells.count("X").even?
      return player_2
    else board.cells.count("O").odd?
      return player_1
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
    binding.pry
    current_move = current_player.move(board)
    # super
    # puts "Please enter 1-9"
    # user_input = gets.strip
    # user_input_index = board.user_input_to_index(user_input)
    if board.valid_move?(current_move)
      board.update(current_move, current_player) && board.display
    else
      puts "invalid move"
      turn
    end
  end
end

Game.start