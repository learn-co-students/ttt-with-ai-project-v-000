class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Mid row
    [6,7,8], # Bottom row
    [0,3,6], # Left col
    [1,4,7], # Mid col
    [2,5,8], # Right col
    [0,4,8], # Left diagonal
    [2,4,6]  # Right diagonal
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?()
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end
  
  def draw?
    if @board.full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw? || @board.full?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      @board.cells[won?[0]]
    else
      nil
    end
  end
  
  def start
    
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
      board.display
    else
      puts "Congratulations #{winner}!"
      board.display
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    board.display
    input = self.current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "invalid"
      turn
    end
  end
  
end