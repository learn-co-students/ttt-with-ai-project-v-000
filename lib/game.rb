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
    #binding.pry
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
  
# if number_of_players == 0 && first_player == 0
#   game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
# elsif number_of_players == 1 && first_player == 0
#   game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
# elsif number_of_players == 1 && first_player == 1
#   game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
# elsif number_of_players == 2 && first_player == 1
#   game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
# elsif number_of_players == 2 && first_player == 2
#   game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
# end
  
  def start
    puts "Hello! Welcome to Tic-Tac-Toe with AI!"
  
    puts "Would you like to play a 0, 1, or 2 player game?"
    
    number_of_players = gets.strip
    
    puts "Which player should go first? You can enter 0, 1, or 2."
    
    first_player = gets.strip
    
    if number_of_players == 0 && first_player == 0
      player_1 = Players::Computer.new("X") && player_2 = Players::Computer.new("O")
    elsif number_of_players == 1 && first_player == 0
      player_1 = Players::Computer.new("X") && player_2 = Players::Human.new("O")
    elsif number_of_players == 1 && first_player == 1
      player_1 = Players::Human.new("X") && player_2 = Players::Computer.new("O")
    elsif number_of_players == 2 && first_player == 1
      player_1 = Players::Human.new("X") && player_2 = Players::Human.new("O")
    elsif number_of_players == 2 && first_player == 2
      player_1 = Players::Human.new("O") && player_2 = Players::Human.new("X")
    end
    Game.new(player_1, player_2)
  end

end
