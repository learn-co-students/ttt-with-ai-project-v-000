class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
    #player 1 has odd turns, player 2 has even turns.
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| #checking 3 item array combinations combo[0] is the first item in the array - if have X in first set, and 2nd set and 3rd set, then it's a win.
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end #checks if everything matches to imply win, not if it's an Xor O
  end

  def draw?
    !won? && @board.full? # not won and full board
  end

  def over?
    draw? || won? # game over - either draw or won
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Please enter 1-9:"
    player_now = current_player
    current_move = player_now.move(@board) # returns "1"
    if !@board.valid_move?(current_move)
      turn
    else
      @board.turn_count+1
      @board.update(current_move, player_now)
      # move the token and check if win/draw
      #start over and ask for valid input
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


  def start
    input = ""
    while input != "exit"
      puts "Welcome to Tic Tac Toe! Enter 'Hi!' to display the board."
      puts "Choose how many players this game: Enter '0', '1', or '2'."
      puts "Choose Player X and Player O. Enter 'X' or 'O'."
      puts "Good luck! Enter 'start'."
      puts "If you want to play again, enter 'Y'."
      puts "To quit, type 'exit'."


      input = gets.strip

      case input

        when "Hi!","Y"
          @board.display
        when "0", "1", "2"
          initialize(player_1, player_2, board)
        when "X", "O"
          current_player
        when "start"
          play
        when "exit"
          over?
      end
    end
  end


end
