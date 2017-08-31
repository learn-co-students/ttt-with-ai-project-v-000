class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [2,4,6], #diagonal up
    [0,4,8] #diagonal down
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    if @board.turn_count.odd?
      player_2
    else
      player_1
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      @board.cells[win[0]] == @board.cells[win[1]] &&
      @board.cells[win[0]] == @board.cells[win[2]] &&
      @board.taken?(win[0]+1)
    end
  end

  def winner
      if won?
        @board.cells[won?[0]]
      else
      end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !@board.valid_move?(current_move)
      puts "Oops!  You can't move there. Try again."
      turn
    else
      @board.update(current_move, player)
      board.display
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

  ### STARTING A GAME ####

  def intro
    puts "It's"
    sleep(0.5)
    puts "  time"
    sleep(0.5)
    puts "    for........"
    sleep(0.5)
    puts "  ____  __  ___    ____  __    ___    ____  __  ____  _"
    puts " (_  _)(  )/ __)  (_  _)/ _\\  / __)  (_  _)/  \\(  __)/ \\"
    puts "   )(   )(( (__     )( /    \\( (__     )( (  O )) _) \\_/"
    puts "  (__) (__)\\___)   (__)\\_/\\_/ \\___)   (__) \\__/(____)(_)\n\n"
    sleep(1)
    start_game
  end

  def no_players
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Computer.new("O")
  end

  def one_player_x
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Computer.new("O")
  end

  def one_player_o
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Human.new("O")
  end

  def two_players
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Human.new("O")
  end

  def start_game
    puts "Enter '1' to play against the computer.\nEnter '2' to play with a friend.\nEnter '0' to watch the computer play itself.\n\n"
    game_type = gets.strip
    if game_type == "0" #two computer players
      no_players
    elsif game_type == "1" #one computer, one human
      puts "Enter 'X' to be Player 1.\nEnter 'O' to be Player 2."
      player_token = gets.strip.upcase
        if player_token == "X"
          one_player_x
        elsif player_token == "O"
          one_player_o
        end
    elsif game_type == "2"
      two_players
    else
      puts "Forgive me; I'm just a computer and not as smart as you.  This is what I understand:"
      start_game
    end
    Game.new(@player_1, @player_2)
    until over?
      play
    end
    game_loop
  end

  def game_loop
    puts "Would you like to play again? (yes or no)"
    answer = gets.strip.downcase
    if answer == "yes"
      Game.new.start_game
    elsif answer == "no"
      puts "Goodbye!"
    else
      puts "You are confusing me, bro."
      game_loop
    end
  end

end
