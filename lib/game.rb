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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]]
        return combo
      end
    end
    false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      combo = won?
      board.cells[combo[0]]
    else
      nil
    end
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
    puts
    board.display
    puts
    while !over?
      print "#{current_player.token}'s turn: "
      turn
      puts
      board.display
      puts
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end