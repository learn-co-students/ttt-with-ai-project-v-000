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
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]] && @board.cells[combination[0]] != " "
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ?  @board.cells[won?.first] : nil
  end
  
  def turn
    board.display
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      puts "Invalid move. Try again."
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def welcome
    puts "What is your name?"
    name = gets.strip
    puts "Welcome, #{name}!"
    start
  end

  def start
    puts "Tell me how many players you have (0-2): "
    puts "0. Computer vs Computer"
    puts "1. You vs Computer"
    puts "2. You vs You"
    type = gets.strip
    
    if type == "0"
      Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new).play
    elsif type == "1"
      puts "Would you like to go first? (Y/N)"
      reply = gets.strip
      if reply.upcase == "Y"
        Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new).play
      else
        Game.new(Players::Computer.new('X'), Players::Human.new('O'), Board.new).play
      end
    elsif type == "2"
      Game.new(Players::Human.new('X'), Players::Human.new('O'), Board.new).play
    else
      puts "I don't think that's right. Please choose between 0, 1, and 2."
    end
    play_again?
  end
  
  def play_again?
    puts "Would you like to play again? (Y/N)"
    input = gets.strip
    if input.upcase == "Y"
      start
    else
      puts "Thanks for playing. Goodbye."
      exit
    end
  end
  
end