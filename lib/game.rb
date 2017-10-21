class Game

  attr_accessor :board, :player_1, :player_2, :token, :index, :player

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


 def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board =Board.new)
  @player_1 = player1
  @player_2 = player2
  @board = board
 end

  def current_player
    if board.turn_count % 2 == 0
     player_1
    else 
     player_2
    end  
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win| 
      board.cells[win[0]] == board.cells[win[1]]&&
      board.cells[win[1]] == board.cells[win[2]]&&
      board.taken?(win[0]+1)
    end   
  end


  def draw?
    !won? && board.full?
  end

  def winner
    if won?
      board.cells[won?.first]
    end
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!" 
    end
    if draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "What kind of game would you like to play?"
    puts "Choose a player mode by inputing '0', '1', or '2'"
    input = gets.strip
    if input == "0"
     @player_1 = Players::Computer.new("X")
     @player_2 = Players::Computer.new("O")
      play
    elsif input == "1"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Human.new("O")
      play
    else input == "2"
      puts "Make first move to be player X"
      if input 
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Human.new("O")
        play
      else
        play 
      end
    end
  end
end