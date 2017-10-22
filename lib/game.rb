class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count.odd?
        player_2
      else
        player_1
     end
   end

   def won?
     WIN_COMBINATIONS.detect do |combo|
       self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[2]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] != " "
     end
   end

   def over?
     won? || draw?
   end

   def draw?
     !won? && board.full?
   end

   def winner
     if won = won?
       board.cells[won.first]
     else
       nil
     end
   end

   def turn
     player = current_player
     input = player.move(self.board).to_i
     if self.board.valid_move?(input)
        self.board.update(input, player)
        self.board.display
     else
      turn
    end
   end

   def play
       until over?
         turn
       end

       if draw?
          puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
      end

end
