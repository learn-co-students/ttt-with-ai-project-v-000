class Game
  attr_accessor :board, :player_1, :player_2

#create a CONSTANT array to contain all possible win combos
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

#set board = to new Board to give access, create new instances of human players passing it the "token" for the Player class
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    #refers to Board class turn_count method for how many turns have pssed
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.find {|win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
      board.cells[win_combo[0]] == board.cells[win_combo[2]] &&
      board.taken?(win_combo[0] + 1)
    }
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? != nil ? board.cells[won?[0].to_i] : nil
  end

  def turn
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
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
