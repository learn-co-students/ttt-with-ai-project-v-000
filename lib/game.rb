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

  def board
    @board
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    counter = 0
    @board.cells.each do |place|
      if place == "X" || place== "O"
        counter+=1
      end
    end
      return counter
  end

  def current_player
    turn_count.even? ? (return player_1):(return player_2)
  end

  def won?
      WIN_COMBINATIONS.each do |set|
        position_1 = @board.cells[set[0]]
        position_2 = @board.cells[set[1]]
        position_3 = @board.cells[set[2]]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
          return [set[0], set[1], set[2]]
        end
    end
    return false
  end

  def full?
    index = 0
    while index<8
      if board.taken?(index) == false
        return false
      else
        index+= 1
      end
    end
    return true
  end

  def draw?
    if  !won? && full?
      return true
    end
  end

  def over?
    if won?|| draw?
      return true
    end
  end

  def winner
    if won? == false
      return nil
    else
      return @board.cells[won?[0]]
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character = "X")
    @board.cells[input_to_index(index)] = character
  end

  def turn
    cur_turn = current_player.move(board)
    if !board.valid_move?(cur_turn) && !over?
      turn
    else
      move(cur_turn, current_player.token)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
