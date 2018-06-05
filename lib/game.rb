require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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
      if board.taken?(combo[0] + 1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
        return combo
      end
    end
  end 
  
  def draw?
    board.full? && !won?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      combo = won?
      board.cells[combo[0]]
    end
  end
    
  def turn
    board.display
    num = current_player.move(board)
    while !board.valid_move?(num)
      num = current_player.move(board)
    end
    board.update(num, current_player)
  end
    
  def play 
    turn until over?
    board.display
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  

  def start
    players = nil
    quit = false
    
    while quit == false
    
      puts "Welcome to Tic-Tac-Toe!"
      puts "What kind of game do you want to play?"
    
      while players != '0' && players != '1' && players != '2'
        puts "Please type '0', '1', or '2' for the number of players:"
        players = gets.strip
      end
    
      if players == '0'
        comp_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
        comp_game.board.display
        puts "The computer will now play itself!"
        #0 player game logic
      end
    
      if players == '1'
        first_player = nil
      
        puts "Who should go first and be 'X'?"
      
        while first_player != 'player' && first_player != 'computer'
          puts "Please enter 'player' or 'computer':"
      
          first_player = gets.strip
        end
      
        if first_player == "player"
          one_player_game = Game.new(Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        else first_player == "computer"
          one_player_game = Game.new(Players::Computer.new("X"), player_2 = Players::Human.new("O"))
        end
      
        one_player_game.board.display
      
        #1 player logic
     end
    
     if players == '2'
       puts "Player one will be 'X'."
      
       two_player_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      
       two_player_game.play
      end
      
      prompt = true
    
      while prompt == true
        puts "Would you like to play again? (Y/n)"
        answer = gets.strip
        if answer == 'n' || answer == 'N'
          quit = true
          prompt = false
        elsif answer == "Y" || answer == "y" || answer == ""
          quit = false
          prompt = false
          players = nil
        else
          prompt = true
        end
      end
      
    end
  end
        
end 