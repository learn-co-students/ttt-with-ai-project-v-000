class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = nil)
    @board = board || @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

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

  def move(index)
    @board.update(index, current_player)
  end

  def valid_move?(index)
    index.between?(1,9) && !@board.taken?(index)
  end

  def turn
    input = current_player.move([])
    if valid_move?(input.to_i)
      move(input)
      @board.display
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]

      position_1 = @board.position(win_index_1+1)
      position_2 = @board.position(win_index_2+1)
      position_3 = @board.position(win_index_3+1)

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end

  def draw?
    if @board.full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      win_combination = won?
      if @board.position(win_combination[0]+1) == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    while !over?
      turn
    end
    if winner == "X"
      puts "Congratulations #{winner}!"
    elsif winner == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
