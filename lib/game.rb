class Game

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |arr|
      if (board.cells[arr[0]] == "X" && board.cells[arr[1]] == "X" && board.cells[arr[2]] == "X") ||
          (board.cells[arr[0]] == "O" && board.cells[arr[1]] == "O" && board.cells[arr[2]] == "O")
          return arr
      end
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    return board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
    current_player = current_player == player_1 ? player_2 : player_1
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "What player game would you like to play? (0-2)"
    player_num = gets.strip
    puts "Which player should go first and have a token of 'X'? (1 or 2)"
    num = gets.strip

    case input
    when "O" && num == "1"
      Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    when "O" && num == "2"
      Game.new(player_1=Players::Computer.new("O"), player_2=Players::Computer.new("X"), board=Board.new)
    when "1" && num == "2"
      Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    when "1" && num == "2"
      Game.new(player_1=Players::Compuyer.new("O"), player_2=Players::Human.new("X"), board=Board.new)
    when "2" && num == "1"
      Game.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    when "2" && num == "2"
      Game.new(player_1=Players::Human.new("O"), player_2=Players::Human.new("X"), board=Board.new)
    end

    board.display
    game.play

    puts "Would you like to play again?(Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      start
    else
      exit
    end 
  end
end
