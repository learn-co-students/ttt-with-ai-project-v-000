require 'pry'

class Game

    attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [ #WIN_COMBINATIONS[0] => [0,1,2]
                     [0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [6,4,2]
                   ]

  def initialize(player_1 = Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
  end

  def current_player
            #even                #odd, X   #even, O
   @board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def won?
    WIN_COMBINATIONS.find do
       |combo| #[0,1,2] @board = X || O ["", "", "", "O", "X", "X", "O", "O", "X"] @board[2] => X
       @board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.taken?(combo[0]+1)
   end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if player = won?
    @winner = @board.cells[player.first]
   end
  end

  def turn

    tokens = current_player  # "X" || "O"
    moving = tokens.move(@board)
     #[" "," "," "," "," "," "," "," "," "] ask for input and give back input
    if !@board.valid_move?(moving)
      puts "Not a valid move"
      puts
      turn #recursion
    else
     @board.update(moving, tokens)
     @board.display
  end
end

  def over?
   won? || draw?
  end

  def play
    until over?
      turn
    end
     if won?
        puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end


end
