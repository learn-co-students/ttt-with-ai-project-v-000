class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def position_taken?(index)
    @board.cells[index] != " "
  end

  def turn
    player = current_player

    puts "Please input a number 1-9:"

    turn_move = player.move(@board)

    if !board.valid_move?(turn_move)
      turn_move = player.move(@board)
    end

    @board.update(turn_move, player)
    @board.display
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[0]] != " "
        return win
      end
    end
    false
  end

  def full?
    @board.all? do |token| token == "X" || token == "O"
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner #review this method again
    winner_token = won?
    winner_token ? @board.cells[winner_token[0]] : nil
  end

  def play
    until over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else won? != nil
      puts "Congratulations #{winner}!"
    end
  end
end
