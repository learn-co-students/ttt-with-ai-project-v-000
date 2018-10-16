require "pry"

class Game
  attr_accessor :board, :player_1, :player_2, :timer

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new, wargame = false)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @ticto = ticto
    @timer = 1.5
  end

  def player
    board.turn_count.even?  ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  def draw?
    board.full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    board.cells[won?[0]] if won?
  end
  def turn
    puts "It's now #{player.token}'s turn."
    input = player .move(board, timer).to_i
    if board.valid_move?(input.to_s)
      board.update(input, player)
      system('clear')
      puts "Game #{@counter}" if @wargame
      board.display
    elsif input.between?(1, 9) == false
      puts "That is an invalid move"
      turn
    else
      puts "your position is taken by the enemy"
      turn
    end
  end
  def play
    board.reset!
    system('clear')
    puts "Game #{@counter}" if @ticto
    board.display
    until over?
      turn
    end
    if draw?
      puts "WINNER: NONE"
    elsif won?
      puts "WINNER: #{winner}"
    end
  end
  def ticto 
    @counter = 0
    x = 0
    o = 0
    draw = 0
    until @counter == 100
      @counter += 1
      play
      if draw?
        draw += 1
      elsif winner == "X"
        x += 1
      elsif winner == "O"
        o += 1
      end
      sleep(@timer*1.5)
      @timer -= (@timer/3)
    end
    puts "This round had #{x} wins for X, #{o} wins for O, and #{draw} draws."
    puts "winning"
    puts "you lost the match"
  end
end
