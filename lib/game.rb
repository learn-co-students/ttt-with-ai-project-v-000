class Game

  attr_accessor :player_1, :player_2, :board, :token

  #defines a constant WIN_COMBINATIONS with arrays for each win combination
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

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    #defaults to two human players, X and O, with an empty board
    #@"board" contains an instance of a board
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #returns the correct player, X, for the third move
    #if sum of x's and o's is even return player_1, else return player_2
    board.turn_count.even? ? @player_1 : @player_2
  end

  def over? #if draw or one of the win combinations, then it is over (e.g. draw occurs when it is full and none of the WIN_COMBINATIONS are met)
    won? || draw?
  end

  def won?
    return winner
  end

  def draw? #returns true for a draw
    board.full? && !won?
  end

  def winner #returns X when X won, returns O when O won, returns nil when no winner
    WIN_COMBINATIONS.each do |combo|
      pos_1 = combo[0]
      pos_2 = combo[1]
      pos_3 = combo[2]
      if board.cells[pos_1] == "X" && board.cells[pos_2] == "X" && board.cells[pos_3] == "X"
        return "X"
      elsif board.cells[pos_1] == "O" && board.cells[pos_2] == "O" && board.cells[pos_3] == "O"
        return "O"
      end
    end
    nil
  end

  def turn
    new_position = nil
    board.display
    if current_player.class == Players::Computer
      puts "#{current_player.token}: Computer\'s Turn"
    end
    until board.valid_move?(new_position)
      new_position = current_player.move(@board)
    end
    board.update(new_position,current_player)
  end

  def play
    until over?
      turn
    end
    board.display
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
