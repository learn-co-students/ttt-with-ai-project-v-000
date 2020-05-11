class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],  #0
    [3,4,5],  #1
    [6,7,8],  #2
    [0,3,6],  #3
    [1,4,7],  #4
    [2,5,8],  #5
    [0,4,8],  #6
    [2,4,6]   #7
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count % 2 == 0
      @player_1
    elsif board.turn_count == 1
      @player_2
    elsif board.turn_count == 0
      @player_1
    elsif board.turn_count % 2 != 0
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def draw?
    if won? 
      false
    elsif (board.full? == true) && (won? == false)
      true
    else
      false
    end
  end

  def over?
    if (won? == true) || (draw? == true) || (board.full? == true)
      true
    else
      false
    end
  end

  def turn
    puts "Enter your move [1-9]:"
    input = current_player.move(board)

    if board.valid_move?(input) == true
      board.update(input, current_player)
    else
      puts "Your input was invalid."
      turn
    end
  end

  def play
    until over? || won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      #play_again
    elsif draw?
      puts "Cats Game!"
      #play_again
    end
  end

  def play_again
    "Do you wish to play again?"
    answer = gets.strip
    if (answer == "yes") || (answer == "YES") || (answer == "Yes")
      start
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players: 0, 1 or 2?"

    human_response = gets.strip.to_i

    if human_response.between?(0,2) == false
      puts "Invalid entry. Please start again."
      start
    elsif human_response == 0
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
       new_game.play
    elsif human_response == 1
      puts "Hello, please enter your name:"
      player1 = gets.strip
      puts "Hello #{player1}! You will be X and the computer will be O."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      new_game.board.first_display
      new_game.play
    elsif human_response == 2
      puts "Who wants to be player 1?"
      puts "Please enter your name:"
      player1 = gets.strip
      puts "Hello #{player1}, you will be player X."
      puts "Player 2, please enter your name:"
      player2 = gets.strip
      puts "Hello #{player2}, you will be player 0."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      new_game.board.first_display
      new_game.play
    end
  end

end
