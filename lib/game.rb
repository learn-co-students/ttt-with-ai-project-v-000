#require '../lib/players/human'

class Game
  #include Players::Human


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

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if @board.valid_move?(input)
        board.update(input, current_player)
        board.display
    else
      turn()
    end
  end

  def play
    counter = 0
    board.display
    while counter < 10
      if over?()
        if draw?()
          puts "Cat's Game!"
          counter = 10
        else won?()
          puts "Congratulations #{winner()}!"
          counter = 10
        end
      else
        turn()
        counter += 1
      end
    end
  end

  def won?
    if(!@board.cells.include?("O") && !@board.cells.include?("X"))
      return false
    else
      WIN_COMBINATIONS.each do |win_combo|
        if (@board.cells[win_combo[0]] == "X") && (@board.cells[win_combo[1]] == "X") && (@board.cells[win_combo[2]] == "X")
          return win_combo
        elsif ((@board.cells[win_combo[0]] == "O") && (@board.cells[win_combo[1]] == "O") && (@board.cells[win_combo[2]] == "O"))
          return win_combo
        end
      end
    end
    return false
  end

  def full?
    !@board.cells.include?(" ")
  end

  def draw?
    if full?() && (won?() == false)
      true
    else
      false
    end
  end

  def over?
    if (won?() || draw?())
      true
    else
      false
    end
  end

  def winner
    win_combo = won?()
    if win_combo == false
      return nil
    elsif @board.cells[win_combo[0]] == "X"
      "X"
    elsif @board.cells[win_combo[0]] == "O"
      "O"
    end
  end

end
