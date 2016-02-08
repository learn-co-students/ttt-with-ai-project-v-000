class Game
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  # WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Left top diagonal
    [6,4,2]  # Right top diagonal 
  ]

    #returns current player based on Board #turn_count
  def current_player
    if @board.turn_count % 2 == 0 
      player_1 # return "X"
    else
      player_2 # return "O"
    end
  end

  def over?
    won? || @board.full? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| # finds and returns first winning combo where position 1, 2 and 3 match X or O
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
      end
  end

  def draw?
    @board.full? && !won?
  end

  # game loop
  def play
    while !over? 
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
      puts"
      /\\___/\\
     ( o   o )
     (  =^=  )
     (        )
     (         )
     (          )))))))))))\n"
    end
  end

  def winner
    if winner_combo = won?
      @winner = @board.cells[winner_combo.first]
    end
  end

  #Single complete turn
  def turn 
    this_move = current_player.move(@board)

    if !@board.valid_move?(this_move) 
      puts "Move was invalid. Try again."
      turn

    else
      puts "Turn: #{@board.turn_count+1}\n"
      puts "#{current_player.token} moved #{this_move}"    
      @board.update(this_move, current_player)
      @board.display
      puts "\n\n"
    end
  end
end
