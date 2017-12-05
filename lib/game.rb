class Game
   attr_accessor :player_1, :player_2, :board

   WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def self.first_player(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
     Game.new(player_1, player_2, board)
   end

   def self.second_player(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     Game.new(player_1, player_2, board)
   end

   def self.wargames(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
     Game.new(player_1, player_2, board)
   end

   def self.game_choice(input = nil)
     puts "Please select wargames, 1, or 2"
     input = gets.chop
     if input == "wargames"
       counter = 0
       computer1 = 0
       computer2 = 0
       draws = 0
       until counter == 101 do
         new_game = @wargames
         new_game.play
         puts "After #{counter} game(s) played: Computer 1 = #{computer1} - Computer 2 = #{computer2} - Cat's Game(s) = (#{counter})"
         counter += 1
         end
         ask
     elsif input == "1"
       puts "Would you like to go first or second?"
       input2 = gets.chop
       if input2 == "first"
         new_game = self.first_player
         new_game.play
         ask
       elsif input2 == "second"
         new_game = self.second_player
         new_game.play
         ask
       end
     elsif input == "2"
       puts "Enjoy! May the best player win!"
       new_game = self.new
       new_game.play
       ask
     end
   end

   def self.ask
     puts "Would You like to play again (Y/N)?"
     input = gets.chop
     if input.match(/[yY]/)
       game_choice
     elsif input.match(/[nN]/)
       exit
     end
   end

   def current_player
     if @board.turn_count.odd?
       player_2
     elsif @board.turn_count.even?
       player_1
     end
   end

   def won?
     WIN_COMBINATIONS.detect do |win_combination|
       @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && @board.taken?(win_combination[0] + 1)
     end
   end

   def draw?
     board.full? && !won?
   end

   def over?
     won? || draw?
   end

   def winner
     if win_combo = won?
      @winner = @board.cells[win_combo.first]
     end
   end

   def turn
     player = current_player
     current_move = player.move(@board)
     if !@board.valid_move?(current_move)
       turn
     else
       @board.update(current_move, player)
     end
     @board.display
   end


   def play
     while !over?
       turn
     end
    if won?
       puts "Congratulations #{winner}!"
     else draw?
       puts "Cat's Game!"
     end
   end
 end
