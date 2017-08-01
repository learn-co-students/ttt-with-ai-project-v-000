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

  def initialize(p1=nil, p2=nil, board=nil)
    @player_1 = p1 || Players::Human.new('X')
    @player_2 = p2 || Players::Human.new('O')
    @board = board || Board.new
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    true if won? || draw?
  end

  def won?
    winning_combo ? true : false
  end

  def draw?
    true if !won? && @board.full?
  end

  def winner
    @board.cells[winning_combo[0]] if over?
  end

  def turn
    player = current_player
    move = player.move(@board)
    if @board.valid_move?(move)
        @board.update(move, player)
        puts "Player #{player.token} moved to #{move}."
        @board.display
        puts "\nTurn #{@board.turn_count + 1}"
    else
      puts 'Your selection was invalid.'
      turn
    end
  end

  def winning_combo
    WIN_COMBINATIONS.find do |win_combo|
      pos_1 = @board.cells[win_combo[0]]
      pos_2 = @board.cells[win_combo[1]]
      pos_3 = @board.cells[win_combo[2]]
      win_combo if pos_1 == "X" && pos_2 == "X" && pos_3 == "X" ||  pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
