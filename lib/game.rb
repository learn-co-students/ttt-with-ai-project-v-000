class Game
  attr_accessor :board, :player_1, :player_2  #provides access to the board, player_1, player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new ) #Game initialize defaults to two human players, X and O, with an empty board
    @board = board                #Game initialize accepts 2 players and a board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [      #defines a constant WIN_COMBINATIONS with arrays for each win combination
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def current_player #returns the correct player, X, for the third move
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over? #returns true for a draw or a won game
    if board.full?
      true
    else
      false
    end
  end

  def won?  #returns false for a draw
    WIN_COMBINATIONS.detect do |combo|
      first_index = combo[0]
      second_index = combo[1]
      third_index = combo[2]
      cell_one = board.cells[first_index]
      cell_two = board.cells[second_index]
      cell_three = board.cells[third_index]

      if cell_one == "X" && cell_two == "X" && cell_three == "X" || cell_one == "O" && cell_two == "O" && cell_three == "O"
        true  #returns the correct winning combination in the case of a win
      else
        false #returns false for a draw
      end
    end
  end

  def draw?
    if board.full? && !won?
      true  #returns true for a draw, returns false for a won game or an in-progress game
    end
  end

  def winner
    #returns X when X won
    !won? ? nil : board.cells[won?.first]
    #returns O when O won
    #returns nil when no winner
  end

  def turn
    position = current_player.move(board)
    if board.valid_move?(position)  #makes valid moves
      board.update(position, current_player)  #changes to player 2 after the first turn
      board.display
    else
      turn  #asks for input again after a failed validation
    end
  end

  def play
    #asks for players input on a turn of the game
    while board.turn_count < 9 && !over?    #checks if the game is over after every turn
       turn
    end
    if won?     #checks if the game is won after every turn
      puts "Congratulations #{winner(cells)}!"  #congratulates the winner X or O
    elsif draw?(board)    #stops playing in a draw
      puts "Cat's Game!"  #prints "Cat's Game!" on a draw
    end
    #plays the first turn of the game
    #plays the first few turns of the game
    #checks if the game is a draw after every turn
    #stops playing if someone has won

     #plays through an entire game

  end
end
