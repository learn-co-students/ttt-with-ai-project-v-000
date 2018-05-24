class Game
  #board and player collaborate through game. methods - current_player, won?, winner, start, play, turn
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # <-- Horizontal win
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # <-- Vertical win
    [0, 4, 8], [2, 4, 6] # <-- Diagonal win
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #use modulo to determine remainder. player_1 is odd turn count and player_2 is even. if a remainder returns, it's player_1.
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board.cells[won?[0]] if won?
  end

  def start
    input = "" #receive gets
    while input != "exit"
      #greets
      puts "Welcome to Tic Tac Toe!"
      #prompts for 0, 1, or 2 players
      puts "What kind of game do you want to play - 0, 1 or 2 player?"
    input = gets.strip
    case input
    when "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
        loop
    when "1"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        loop
    when "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O")).play
        loop
    else
      puts "That is an invalid entry."
      start
      end
    end

    def loop
      #asks who goes first and is "X"
      puts "Who goes first and wants to be the X player?"
      input = gets.strip
      case input
      when "X"
        player_1
        start
      when "O"
        player_2
        start
      else
        puts "Try again."
        start
    end
    #correctly initialized the game board
    Board.new
    #end of game and play again, choose new config, or exit
    puts "It's the end of the game. Play again?, Choose new player? or to quit, type 'exit'."
    input = gets.strip
    start
    end
  end

  def turn
    puts "It's #{current_player.token} turn. Please enter a number from 1 - 9."
    input = current_player.move(board).to_i
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    elsif @board.valid_move?(input) == false
      puts "OOPs. Please try again. That is an invalid move."
      turn
    else
      puts "OOPs. This position is taken"
      turn
    end
  end

  def play
    # board.reset!
    turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
