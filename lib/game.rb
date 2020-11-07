class Game
  attr_accessor :player_1, :player_2, :board
  def initialize (player_1=Players::Human.new("X"), player_2= Players::Human.new("O") , board=Board.new)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end
  WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
            ]
    def current_player
      if @board.turn_count % 2==0
          @player_1
      else
          @player_2
      end
    end

    def won?

         false
         WIN_COMBINATIONS.any? do |win_combination|

             if (@board.cells[win_combination[0]]=="X"||@board.cells[win_combination[0]]=="O") &&
               @board.cells[win_combination[0]]==@board.cells[win_combination[1]] &&
               @board.cells[win_combination[0]]==@board.cells[win_combination[2]]
               return win_combination
             end
          end
     end

     def draw?
         false
       if @board.full? && !self.won?
         true
       end
     end
     def over?
       false
       if self.won?||self.draw?
         true
       end
     end
     def winner
       nil
       if self.won?
            @board.cells[self.won?[0]]
       end
     end
     def turn
       input=self.current_player.move(@board)
       until @board.valid_move?(input)
         input=self.current_player.move(@board)
       end
       @board.update(input,current_player)
       @board.display

    end
    def play
      until self.over?
        self.turn
      end
      if self.over?
        if self.draw?
          puts "Cat's Game!"
        elsif self.won?

          puts "Congratulations #{self.winner}!"
        end
      end
    end


end
