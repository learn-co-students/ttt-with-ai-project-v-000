class Game
  attr_accessor :board,:player_1,:player_2
  attr_reader :winner
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],  
    [6,7,8], 
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]
    def initialize(player_1=Human.new("X"),player_2=Human.new("O"),board=Board.new)
	    @player_1 = player_1
	    @player_2 = player_2
	    @board = board
    end


  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end


  def over?
    if @board.full? || won? || draw?
    	true
  end
end


 def won?
  @winner = nil
        WIN_COMBINATIONS.each do |wincombo|
          if wincombo.all? {|position| @board.cells[position] == "X"}
            @winner = "X"
          elsif wincombo.all? {|position| @board.cells[position] == "O"}
            @winner = "O"
          end
        end
        if @winner
          return true
        else
          false
        end
  end

  def winner
    if won?
      @winner
    end
  end

  def draw?
    if @board.full? && self.won? == false
      true
     else
     	false
    end
  end

    def turn
    self.board.display
     move = current_player.move(@board) 
     if @board.valid_move?(move)
       @board.update(move,current_player)
     else
      turn
    end
    end

    def play
       until over?
  	      turn
       end
         if won?
           self.board.display
          puts "Congratulations #{winner}!"
          play_again
        elsif draw?
        	 self.board.display
          puts "Cats Game!" 
          play_again  
        end
    end

      def self.new_game
      game = self.new
      puts "How many players 0,1 or 2?"
      players = gets.chomp

      if players.to_i == 0 
          game.player_1 = Computer.new("X")
          game.player_2 = Computer.new("O")
          game.play 
      elsif players.to_i == 1
          puts "Would You like to first and be X or go second and be O ?"
          puts "Please select your token X or O"
          input = gets.chomp.upcase
          if input == "X"
            game.player_2 = Computer.new("O")
            game.play
          elsif input == "O"
            game.player_1 = Computer.new("X")
            game.play
          else
            self.new_game
          end  
      elsif players.to_i == 2
        game.play
      else  
        self.new_game
      end  
     end

     def play_again
      puts "Would you like to play again Y/N"
      input =gets.chomp.upcase
        if input == "Y"
          Game.new_game
        elsif input == "N"
          puts "Goodbye!"
        else
          play_again
        end
    end


 end
