class Game
  
  extend Players
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
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
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]
      
      all_O = [position_1, position_2, position_3].all? do | element |
        element == "O"
      end
        all_X = [position_1, position_2, position_3].all? do | element |
          element == "X"
        end
        if all_O || all_X
          return win_combination
        end
      end
    false
  end
  
  def draw?
    if !won? && !board.cells.include?(" ")
      true
    else
      false
    end
  end
  
  def over?
    (won? || draw?)? true : false
  end
  
  def winner
    (won?)? board.cells[(won?)[0]] : nil
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input) 
      board.update(input, current_player)
      board.cells
    else 
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if winner == "O"
      puts "Congratulations O!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
  
end
