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

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") ||
         (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
         return win_combo
      end
    end
    return false
  end

  def draw?
    if board.full? == true && self.won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true || !won? == false || board.full? == true
      return true
    else
      return false
    end
  end

  def winner
    win_combo = won?
    if win_combo == false
      return nil
    elsif board.cells[win_combo[0]] == "X"
      return "X"
    elsif board.cells[win_combo[0]] == "O"
      return "O"
    end
  end

  def turn
    puts "Please enter a number"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input,current_player)
      board.display
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
