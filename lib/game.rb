class Game
  
  attr_accessor :board, :player_1, :player_2 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7 ,8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    # does the board, have each token type, matching these arrays
    # this needs to happen at each turn
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0]+1)
    end
  end
  
  def draw?
    @board.turn_count == 9 && !won?
  end
  
  def over?
    #if board is full, OR if someone won
    won? || draw?
  end
    
  def winner
    if won = won?
      @board.cells[something.first]
    end
  end
  
  def turn
    current_player
    the_move = current_player.move(@board)
    if !@board.valid_move?(the_move)
      puts "Sorry, this isn't a valid move, Mister #{player.token}."
      turn
    else
      puts "\n"
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(the_move, current_player)
      @board.display
    end
  end
  
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end  
    
end