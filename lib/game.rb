class Game

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] == "X" and board.cells[combo[1]] == "X" and board.cells[combo[2]] == "X") or
      (board.cells[combo[0]] == "O" and board.cells[combo[1]] == "O" and board.cells[combo[2]] == "O")
        return combo
      end
    end
    return nil
  end

  def over?
    board.full? or won? or draw?
  end

  def draw?
    board.full? and !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      print "Try again! "
      turn
    end
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
