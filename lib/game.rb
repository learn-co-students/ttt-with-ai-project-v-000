class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def turn_count
    cells.count { |turn| turn !=" "}
    end
    def current_player
    @board.turn_count.even? ? player_1 : player_2
    end
    def over?
       won? || draw?
     end
   
     def won?
       WIN_COMBINATIONS.detect do |combo|
     if @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
       (@board.cells[combo[0]] == 'X' || @board.cells[combo[0]] == 'O')
       return combo
     else
       false
     end
   end
 end
   
     def draw?
       board.full? && !won?
     end
   
     def winner
       if combo = won?
     board.cells[combo[0]]
   end
 end
   
     def turn
       play = current_player.move(board)
       if board.valid_move?(play)
         board.update(play, current_player)
       else
         turn
       end
     end
   
     def play
       until over?
         turn
         board.display
       end
       if won?
       puts "Congratulations #{winner}!" 
       elsif draw?
       puts "Cat's Game!" 
       end
      end 
    end   