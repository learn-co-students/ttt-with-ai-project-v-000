class Game
  
  attr_accessor :board, :player_1, :player_2, :token
  
  WIN_COMBINATIONS=[
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ]
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even? 
        @curr_player = @player_1
      else
        @curr_player = @player_2
      end
    #  binding.pry
      @curr_player
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
          @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]] && @board.cells[combination[1]] != " "
    end
  end

    
    def draw?
      !won? && @board.full? 
    end
    
    def over?
      draw? || won? 
    end
    
    def winner
    #  binding.pry
         @board.cells[won?.first] if won?
    #  binding.pry
    end
    
    def turn
      @board.display
      puts " "
      player = current_player
   #   binding.pry
      moves = player.move(@board)
      if !@board.valid_move?(moves)
        puts "That's not a valid move! Try again.\n"
        turn
      else 
        puts "Turn: #{@board.turn_count+1}\n"
        @board.update(moves, player) 
        @board.display
        puts "#{player.token} moved to #{moves}.\n\n"
        
      end
    end
    
    def play
      while !over? 
        turn
      end
      if won? 
    #    binding.pry
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
      play_again?
    end
    
    def start
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      puts "Welcome to Tic Tac Toe!"
      puts "How many human players will be playing? (0-2)"
      num_of_players = gets.strip.to_i
      if num_of_players == 1
        puts "Which player should go first (H or C)?"
        first_player = gets.strip.downcase
          if first_player.downcase == "c"
            @player_2 = Players::Human.new("O")
          else
            @player_1 = Players::Human.new("X")
          end
      end
      if num_of_players == 2
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Human.new("O")
      end  
  #  binding.pry
      play
    end
    
    def play_again?
      puts "Would you like to play again? (Y or N)"
      another_game = gets.strip.downcase
      if another_game == "y"
        Game.new.start
      else
        exit
      end
    end
end
