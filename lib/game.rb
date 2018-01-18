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
    [6,4,2]
  ]

  #Initializes the game with two players and a new board - If the players aren't specified, then the
  #game initializes with two human players
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #Keeps track of the current player
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  #Checks to see if the game was won
  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] && @board.taken?(combination[0]+1)
    end
  end

  #Checks to see which player won
  def winner
    if win = won?
      @winner = @board.cells[win.first]
    end
  end

  #Checks if the game ended in a tie - A tie if the board is full but no one has won
  def draw?
    @board.full? && !won?
  end

  #Checks if the game is over - Either if someone has won or if there is a draw
  def over?
    won? || draw?
  end
  

  #Allows the player to update the board each turn and prints it back out
  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n"
      puts "\n"
    end
  end

  #The play method keeps playing turns until the game is over
  def play

    @board.example

    until over?
      turn
    end

    if draw?
      puts "Cats Game!"
      return self.winner
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end