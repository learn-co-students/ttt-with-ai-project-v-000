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


  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  # Counts tokens to calculate whose turn
  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    @board.full?
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

  def draw?
    if self.over? && self.won? == false
      true
    end
  end

  #Counts number of each token & uses won? method to find winner
  def winner
    if won?
      @winner
    end
  end

    # Uses player move method to get move and update if valid else repeat turn method
    def turn
     move = current_player.move(@board) 
     if @board.valid_move?(move)
       @board.update(move,current_player)
     else
      turn
    end
    end

    def play
        self.board.display
        if won?
          puts "Congratulations #{winner}!"
          play_again
        elsif draw?
          puts "Cats Game!" 
          play_again  
        else
          turn
          play
        end
    end

    def play_again
      puts "Would you like to play again Yes or No"
      input =gets.chomp.upcase
        if input == "YES"
          Game.new_game
        elsif input == "NO"
          puts "Goodbye!"
        else
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





  


end





