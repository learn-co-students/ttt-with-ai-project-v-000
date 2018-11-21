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
    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to have 0, 1 or 2 players?" 
    number_players = gets.strip
      if number_players == "0"
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
      elsif 
        number_players == "1"
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
      elsif 
        number_players == "2"
          player_1 = Players::Human.new("X")
          player_2 = Players::Human.new("O")
      else 
        puts "Would you like to have 0, 1 or 2 players?"
        number_players = gets.strip 
    puts "Player X will go first, would you like Player 1 or Player 2 to start the game? Please enter 1 or 2"
    first_player = gets.strip
      if first_player == 1 
        new_game = Game.new(player_1, player_2, board = Board.new)
        new_game.play
      elsif 
        first_player == 2 
        new_game = Game.new(player_2, player_1, board = Board.new)
        new_game.play
      else 
        puts "Player X will go first, would you like Player 1 or Player 2 to start the game? Please enter 1 or 2"
        first_player = gets.strip
      end
    end
  end 
    
end 