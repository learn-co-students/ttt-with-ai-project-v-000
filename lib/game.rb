class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.cells.select {|cell| cell == " "}.count.even? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |i|
      cell = board.cells
      cell[i[0]] != " " && cell[i[0]] == cell[i[1]] && cell[i[1]] != " " && cell[i[1]] == cell[i[2]]
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      index = won?.first
      return board.cells[index].to_s
    end
  end

  def turn
    player = current_player
    user_input = player.move(board)
    puts "#{player} please select your move"
    if board.valid_move?(user_input)
      return board.update(user_input, player)
    else
      puts "invalid"
      turn
    end
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
