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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @counter = nil # used to display game number for wargames mode
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all?{|element| board.cells[element] == "X"} || combo.all?{|element| board.cells[element] == "O"}
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    if player_1.class == Players::Human && player_2.class == Players::Human # display player prompt if there are two human players
      if current_player == player_1
        puts "Player 1's turn"
      elsif current_player == player_2
        puts "Player 2's turn"
      end
    end
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      system('clear')
      puts "Game #{@counter}" if @counter # display game number for wargames mode
      board.display
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    system('clear')
    puts "Game #{@counter}" if @counter # display game number for wargames mode
    board.display
    until over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

  def wargames # Computer vs. Computer 100 times with outcomes
    x_wins = 0
    o_wins = 0
    draws = 0
    @counter = 1
    while @counter <= 100
      play
      if winner == "X"
        x_wins += 1
      elsif winner == "O"
        o_wins += 1
      elsif draw?
        draws += 1
      end
      @counter += 1
      board.reset!
      sleep(0.25)
    end
    puts "Out of 100 games - 'X' wins: #{x_wins}, 'O' wins: #{o_wins}, and draws: #{draws}"
  end

end
