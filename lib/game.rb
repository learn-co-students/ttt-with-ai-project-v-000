class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @win = []
  end

  def current_player
    @board.turn_count % 2 == 0? @player_1 : @player_2
  end


  def won?
    WIN_COMBINATIONS.each do |comb|
      if @board.cells[comb[0]] == "X" && @board.cells[comb[1]] == "X" && @board.cells[comb[2]] == "X"
        @win = comb
        return true
      end
      if @board.cells[comb[0]] == "O" && @board.cells[comb[1]] == "O" && @board.cells[comb[2]] == "O"
        @win = comb
        return true
      end
    end
    return false
  end

  def draw?
    if !(won?) && @board.full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board.cells[@win[0]]
    else
      return nil
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play()
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner()}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end