class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :players

  WIN_COMBINATIONS = [
    [2,5,8],
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [6,4,2]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] != " " &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
     board.cells[won?[0]] if won?
  end

  def turn
    move = current_player.move(board)
    if !board.valid_move?(move)
      turn
    else
      board.update(move, current_player)
      board.display
    end
  end

  def play
    board.display
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"


    puts "Would you like to play again? (Y/n)"
    input = gets.strip.downcase

    start unless input == "n"
  end

  def start
    puts "What kind of game would you like to play? (0/1/2)-player"    # /s can be converted to 0 with to_i
    @players = gets.strip
    start unless ["0", "1", "2"].include?(players)
    call_start_player
  end

  def call_start_player
     case players
     when "0"
       p1_name = "Computer 1"
       p2_name = "Computer 2"
       p1 = Players::Computer.new("X")
       p2 = Players::Computer.new("0")
     when "1"
       p1_name = "Player"
       p2_name = "Computer"
       p1 = Players::Human.new("X")
       p2 = Players::Computer.new("0")
     when "2"
       p1_name = "Player 1"
       p2_name = "Player 2"
       p1 = Players::Human.new("X")
       p2 = Players::Human.new("0")
     end

     p1.name = p1_name
     p2.name = p2_name

    puts "Who should go first and be \"X\"? #{p1.name}(1) or #{p2.name}(2)?"
    start_player = gets.strip.to_i
    call_start_player unless [1,2].include?(start_player)

    puts start_player == 1 ? "#{p1.name} is starting against #{p2.name}." : "#{p2.name} is starting against #{p1.name}."
    start_player == 1 ? Game.new(p1, p2).play : Game.new(p2, p1).play
  end
end
