class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    # @board.full?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = @board.cells[win_index_1]
     position_2 = @board.cells[win_index_2]
     position_3 = @board.cells[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     end
   end
   false
 end

   def draw?
     @board.full? && !won?
   end

   def winner
     if won?
       @board.cells[won?[0]]
     else
       nil
     end
   end

   def turn
     player = current_player
     input = player.move(@board)
     if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
     else
       turn
   end
 end

  def play
    until over? || won? || draw?
      turn
    end
    if won?
      @board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      @board.display
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players do you have? Type 0, 1, or 2:"
    num_of_players = gets.strip.to_i

          if num_of_players == 0
                game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

          elsif num_of_players == 1
            puts "Do you want to go first? Y/N"
              input = gets.strip

              if input == "Y" || input == "y"
                game = Game.new(Players::Human.new("X"),Players::Computer.new("O"))
              elsif  input == "Q" || input == "q"
                exit
              else
              game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
            end

          else
            game = Game.new
            puts "X will play first."
          end
      game.play
      puts "Exit? Y/N"
      response = gets.strip
      if response == "n"
        Game.start
      else
        exit
      end
    end
  end
