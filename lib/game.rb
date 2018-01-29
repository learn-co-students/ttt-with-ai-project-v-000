require 'pry'


 class Game

   attr_accessor :board, :player_1, :player_2

   #define all winning combinations
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

   #initializes player 1 and player 2 with defaults X and O.
   #initiales a new game board with default blank board
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

   #displays board
   def board
     @board
   end

   #check for current player by seeing what turn_count is
   #if even, both players have gone so then it's player 1 against
   def current_player
     @board.turn_count.even? ? @player_1 : @player_2

   end

   #checks to see if the game has been won or if it's a draw
   def over?
     won? || draw?
   end

   #looks through win_combinations for the first matching combo
   #if all combo cells are X, set @winner as X, and return the combo
   #if all combo cells are O, set @winner as O, and return the combo
   #if neither are true, return nil.
   def won?
     WIN_COMBINATIONS.detect do |combo|
       if combo.all? {|c| @board.cells[c] == "X"}
         @winner = "X"
         return combo
       elsif combo.all?{|c| @board.cells[c] == "O"}
         @winner = "O"
         return combo
       end
     end
     nil
   end

   #check to see if it's a draw game by verifying board full?
   #to be a draw, the game must not be a won game.
   def draw?
     @board.full? && !won?
   end

   #if the game is won, return the first cell in the winning combo
   #if not won, return nil
   def winner
     won? ? board.cells[won?[0]] : nil
   end

   #grabs the current players board selection and store in input
   #if the move is valid, it updates the board with the move and player token.
   def turn
     input = current_player.move(board)

     if board.valid_move?(input)
       board.update(input, current_player)
       board.display
     else
       turn
     end
   end


   #if the game isn't over, keep taking turns
   #over method verifies if the gave has been won or is a draw
   #after every turn verify if it's a won game or a draw game
   def play
     while !over?
       turn
     end
     won? ? (puts "Congratulations #{@winner}!") : (puts "Cat's Game!")

   end
 end
