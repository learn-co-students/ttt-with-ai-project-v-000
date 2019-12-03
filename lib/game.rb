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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board    =  board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] && @board.cells[winner[1]] == @board.cells[winner[2]] && (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    if Players::Human
      puts "Player #{current_player.token}, enter a number between 1 and 9:"
    end
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      system("clear")
      puts "Turn: #{@board.turn_count+1}\n"
      # @board.display
      @board.update(current_move, player)
      puts "Player #{player.token} moved to position #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    board.display
    while !over?
      turn
    end
    if won?
      puts "Congratulations Player #{winner}!\n\n"
    else
      puts "Cat's Game!"
    end
    start_again?
  end

  def start_again?
    puts "Would you like to play again? (Y/n)"
    answer = gets.strip
    if answer.downcase == "y"
      mode
    elsif answer.downcase == "n" || answer.downcase == "quit" || answer.downcase == "exit"
      system("clear")
      puts "GOODBYE!"
      gets
      exit!
    end
  end



end
