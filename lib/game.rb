class Game
  attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
    #initializes players with default "X" and "O'
    #initializes board with a new board
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end


        #uses turn count to determine which player's turn it is
        #if player_1 went, next turn is player_2
        def current_player
          if @board.turn_count.even?
            player_1
          else
            player_2
          end
        end

     #iterate over win combinations
     #determine is combination is true
     def won?
       WIN_COMBINATIONS.detect do |combo|
         if combo.all?{|i| board.cells[i] == "X"}
           @winner = "X"
           return combo
         elsif combo.all?{|i| board.cells[i] == "O"}
           @winner = "O"
           return combo
         else
           nil
         end
       end
       end


     def draw?
       @board.full? && !won?
     end
     #returns true if win or draw
     def over?
       won? || draw?
     end

     #displays winner after game is won
     def winner
       self.won?
       @winner
     end

     #gets users move and stores it in "input"
     #if move is valid, updates and displays the board. If not valid, asks
     #for new move
     def turn
       input = current_player.move(board)

       if board.valid_move?(input)
         board.update(input, current_player)
         board.display
       else
         turn
       end
     end

     #determine if the game is over
     #is not over, keep playing turns
     #determines after each tern if the game is won or draw
     #congrats the winner
     def play
       if !over?
         turn
         play
      else
       won? ? (puts "Congratulations #{@winner}!") : (puts "Cat's Game!")
     end
     end



end
