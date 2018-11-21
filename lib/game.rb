class Game 
  
  attr_accessor :player_1, :player_2, :board, :token
  
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
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def current_player
    token = @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won? 
    if WIN_COMBINATIONS.any?{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && !(@board.cells[combo[1]] == " ") }
      winner = WIN_COMBINATIONS.find{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && !(@board.cells[combo[1]] == " ") }
      winner
    else 
      false
    end
  end 
    
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end 
  
  def winner 
    if won? 
      @board.cells[won?.first]
    else 
      nil 
    end 
  end 
  
  def turn
    @board.display
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end 
  
  def play 
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
  
  def start 
    input = ""
    while input != "exit"
      puts "Welcome to Tic Tac Toe!"
      puts "Would you like to have 0, 1 or 2 players?"
      input = gets.strip 
      
      case input 
        when "0"
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
          new_game = Game.new(player_1, player_2, board = Board.new)
          new_game.play
        when "1"
          puts "Player X will go first, would you like to be X? If so, please enter yes or no." 
          response = gets.strip 
          if response == "yes"
            puts "Great! You will go first."
            player_1 = Players::Human.new("X")
            player_2 = Players::Computer.new("O")
            new_game = Game.new(player_1, player_2, board = Board.new)
            new_game.play
          else 
            input == "no"
            puts "Great! You will go second."
            player_1 = Players::Human.new("O")
            player_2 = Players::Computer.new("X")
            new_game = Game.new(player_1, player_2, board = Board.new)
            new_game.play
          end
        when "2"
          puts "Player X will go first, would you like to be X? If so, please enter yes or no."
          if input == "yes"
            player_1 = Players::Human.new("X")
            player_2 = Players::Human.new("O")
            new_game = Game.new(player_1, player_2, board = Board.new)
            new_game.play
          else 
            input == "no" 
            player_1 = Players::Human.new("O")
            player_2 = Players::Human.new("X")
            new_game = Game.new(player_1, player_2, board = Board.new)
            new_game.play
          end 
        
      end
    end
  end 
    
end 

# plays differently the second time around 
# if "no" i become O but X issn't going first. instructions are confusing. 
# how do i pass the checklist? 