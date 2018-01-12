

###### NOTE : Issue with "rspec spec/04_game_spec.rb" - to confirm resolution with partner
# "1) Game #won? returns the correct winning combination in the case of a win" --> Has 2 "won" combinations in the spec board

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [2,5,8],   # Right Col ## NOTE : Re-ordered due to strange spec requirement
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,4,8],  # Diagonal Left Top to Right Bottom
    [2,4,6],  # Diagonal Right Top to Left Bottom
    [0,3,6],  # Left Col
    [1,4,7]  # Middle Col
    #[2,5,8]   # Right Col
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 if player_1 != Players::Human.new("X")
    @player_2 = player_2 if player_2 != Players::Human.new("O")
    @board = board if board != Board.new
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      end
    end
    false
  end

  def draw?
    full? && !(won?)
  end

  def full?
    @board.cells.all?{|position| position == "X" || position == "O"}
  end

  def winner
    win = won?
    if win != false
      @board.cells[win[0]]
    else
      nil
    end
  end


  def turn
      puts "Player 1 = #{@player_1} || Player 2 = #{@player_2}"
      playerMove = current_player.move(@board)
      if @board.valid_move?(playerMove)
        #puts "update space #{input.to_i} with #{current_player.token}"
        @board.update(playerMove, current_player)
        # @board.display
      else
        puts "invalid move"
        turn
      end
    end

  def play
    while !(over?) do
      turn
      @board.display
    end
    if won?
      win = winner
      puts "Congratulations #{win}!"
    else
      puts "Cat's Game!"
    end
  end


  def start
    # Greeting
    puts "Hello and welcome to Tic Tac Toe!"

    # Getting the players
    puts "Would you like to play a game with 0, 1, or 2 players?"
    player_Num = gets.strip
    puts "Chosen num = #{player_Num.to_i}"
    while player_Num.to_i < 0 || player_Num.to_i > 2
      puts "Please select 0, 1, or 2 players"
      player_Num = gets.strip
    end

    # Setting up the players
    player_1 = Players::Human.new("X")
    player_2 = Players::Human.new("O")
    if player_Num.to_i == 0
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
    end
    if player_Num.to_i == 1
      puts "Would you like to go first? [Y/N]"
      selection = gets.strip
      if selection == "n" || selection == "N"
        player_1 = Players::Computer.new("X")
      else
        player_2 = Players::Computer.new("O")
      end
    end

    # players = [player_1, player_2]
    # return players

    # Initialize the Game
    game = Game.new(player_1, player_2)
    game.play

    # Replay or exit
    puts "Would you like to play again with a new configuration? [Y/N]"
    replay = gets.strip
    if replay == "y" || replay == "Y"
      start
    end

  end


end
