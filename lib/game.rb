class Game

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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

    @player_1 = player_1
    @player_2 = player_2
    @board = board


  end

  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1


  end


  def over?
    won? || draw?

  end

  def won?
    winning_moves = WIN_COMBINATIONS.detect do |winning_array|
      # winning_array in example is [0,1,2]
      index1 = winning_array[0]
      index2 = winning_array[1]
      index3 = winning_array[2]
      position1 = board.cells
      board.cells[winning_array[0]] == board.cells[winning_array[1]] && board.cells[winning_array[1]] == board.cells[winning_array[2]] && board.taken?(index1 + 1)
    end

    if winning_moves == nil
      return false
    else
      return winning_moves
    end
  end

  def draw?
    @board.full? && !won?
  end


  def winner

    if won?
      return board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    board.display
    move = player.move(@board)

    if @board.valid_move?(move)
      @board.update(move, player)

    else
      turn

    end

  end

  def play
     while !over?
       turn
     end
     puts "Congratulations X!"
     puts "Congratulations O!"
     puts "Cat's Game!"
  end


end
