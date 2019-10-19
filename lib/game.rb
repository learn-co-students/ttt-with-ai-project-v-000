class Game
  attr_accessor :player_1, :player_2, :board

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
  end

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


def current_player
  @board.turn_count.even? ? @player_1 : @player_2
end


def won?
WIN_COMBINATIONS.detect do |combo|
@board.cells[combo[0]] == @board.cells[combo[1]] &&
@board.cells[combo[1]] == @board.cells[combo[2]] &&
@board.taken?(combo[0]+1)
end
end


  def draw?
    @board.full? && !won?
end

  def over?
    if won? || draw?
       true
    else
      false
     end
    end

  def winner
    if player = won?
   @winner = @board.cells[player.first]
    end
  end


def turn
  current_move = current_player.move(@board)
   if !@board.valid_move?(current_move)
     turn
   else
     @board.display
     @board.update(current_move, current_player)
   end
  end



  def play
  until over?
     turn
   end
   if won?
      puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end
 end


 def self.start
    puts "Select the number of players: (0-2)?"
    input = gets.strip

 			  if input == "0"
 			    puts "Computer vs Computer"
           game = self.new(Players::Computer.new("X"), Players::Computer.new("O"))
         game.play
  elsif input == "1"
 			    puts "Human vs Computer. Who would you like to go first? (enter: me or computer)"
 			    first_player = gets.strip
 			    if first_player == "me"
           game = self.new(Players::Human.new("X"), Players::Computer.new("O"))
             game.play
 			    elsif first_player == "computer"
              game = self.new(Players::Computer.new("X"), Players::Human.new("O"))
 			   game.play
       else
           puts "That is not a valid input."
           self.start
         end
       else self.new.play
    end
           puts "Would you like to play again? (yes or no)"
           input = gets.chomp
             if input == "yes"
               self.start
               else
               exit
            end
        end
      end
