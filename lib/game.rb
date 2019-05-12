class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],    
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]
    ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
    # count = board.turn_count
    # count.odd? ? player_2 : player_1 
  end 
  
  def won?
    WIN_COMBINATIONS.detect { |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] &&
      @board.taken?(winner[0]+1)
    # (@board.cells[winner[0]] = "X" || @board.cells[winner[0]] = "O")
    }
  end 
  
  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end
  
  def winner
    if winning_combo = won? 
      @winner = @board.cells[winning_combo.first]
    end
  end 
  
  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count + 1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
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
    # mode = ["0 player", "1 player", "2 player"]
    #   0 = mode[0]
    #   1 = mode[1]
    #   2 = mode[2]
    
    print "Please choose the mode of game which you would like to play:
              0 = Computer against itself,
              1 = You against the computer,
              2 = You and another human.
              
              "
    gets.strip.to_i
    
    print "Which token would you like to play?
             X or O"
     if gets.chomp.include?("X") then player_1 = "X"
     else player_1 = "O"
     end 
    
   
    self.play until over?
      self.replay
  end

  def replay
    print "Would you like to play again?"
      if "Y" || "yes" || "Yes" || "YES"
        then game.new.start
      elsif "exit"
        puts "Hope you had fun playing!!"
      end
  end

end