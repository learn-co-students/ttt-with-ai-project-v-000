

class Game
  #include TTTGame::InstanceMethods

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def current_player_human?
    current_player.class == Human 
  end

  def current_player_computer?
    current_player.class == Computer
  end

  def full?
    board.full?
  end

  def over?
    draw? || won?
  end

  def draw?
    full? && !won?
  end

  def x_win?
    WIN_COMBINATIONS.any? {|i| (i-board.all_X).empty?}
  end

  def o_win?
     WIN_COMBINATIONS.any? {|j| (j-board.all_O).empty?}
  end

  def won?
    x_win? || o_win?
  end 

  def winner
    if x_win?
      "X"
    elsif o_win?
      "O"
    end
  end

  def turn
    spot = current_player.move(board)
    if board.valid_move?(spot)
      board.update(spot, current_player)
      board.display 
    else
      puts "That's not going to work."
      turn
    end
  end

  def play
    puts "You put in a number 1-9 that corresponds to the empty spaces on a game board."
    board.display
    puts "See that?  1-3 across the top, 4-6 in the middle, and the bottom is 7-9."
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
    #play_on <== COMMENT OUT FOR REPLAYS: TESTS FAIL IF ACTIVE
    puts "Okay byeeeeee..."
  end

  def play_on
    puts "Want to play again?"
    input = gets.chomp
    if /y/i === input || /yes/i === input
      StartGame.new
    else
      puts "Okay byeeeeee..."
      return
    end
  end

  def play_difficult
    puts "You think you are tough, eh?\nYou put in a number 1-9 that corresponds to the empty spaces on a game board."
    board.display
    puts "See that?  1-3 across the top, 4-6 in the middle, and the bottom is 7-9."
    until over?
      if current_player_human?
        turn
      elsif current_player_computer?
        computer_turn
        board.display
      end 
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
    play_on
  end

  def computer_play
    until over?
      computer_turn
    end
  end

  def computer_turn
    spot = current_player.computer_master_move(board)
    if board.valid_move?(spot)
      board.update(spot, current_player)
    else
      puts "COMPUTER is thinking..."
      computer_turn
    end
  end
end


  
