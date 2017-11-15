class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # Creates a new game, defaulting to two human players (one X and one O) and a new, empty board.
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    # Determines who the current player is based on the count of turns
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    # Returns true if all cells have either an X or O utilizing the full method in Board class.
    board.full?
  end

  def won?
    # Iterates through each combo in WIN_COMBINATIONS to detect if there is a row or column that has 3 Xs of 3 Os.
    # Returns that particular winning combo array.
    WIN_COMBINATIONS.detect do |combo|
      (board.position(combo[0]+1) == "X" && board.position(combo[1]+1) == "X" && board.position(combo[2]+1) == "X")||
        (board.position(combo[0]+1) == "O" && board.position(combo[1]+1) == "O" && board.position(combo[2]+1) == "O")
    end
  end

  def draw?
    # Returns true if the game has not been determined to have been won but the board is full.
    !won? && over?
  end

  def winner
    # Returns either X or O as the winner based on the token in the return value of won?.
    board.position(won?[0] + 1) if won?
  end

  def turn
    # Displays the board and prints instructions for the player on each turn. Utilizing the Players::Human or Players:Computer class
    # to "get" a move, it will check whether the move is valid.  If it is, it will update the board with the X or O. If not, it will
    # output a message to player that the move is not valid and ask the player again for a move.
    board.display
    puts ""
    puts "#{current_player.token}'s turn. Please enter 1-9:"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    elsif !board.valid_move?(move)
      puts "That location is taken or is an invalid move.  Please enter a valid move."
      turn
    end
  end

  def play
    # Checks each turn that the game has not been won and that there isn't a draw.  If not, it delays one second (useful for seeing the
    # changes to the board each turn) then runs the turn method.
    # If the game has been won, it will display the board and congratulate the winner of X or O.  If there is a draw, it will display the
    # board and output the message of Cats Game.
    while !draw? && !won?
      sleep(1)
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      board.display
      puts "Cat's Game!"
    end
  end

end
