class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    winner != nil
  end

  def draw?
    board.full? && !won?
  end

  def winner
    cells = board.cells
    win_cell = WIN_COMBINATIONS.detect do |r|
      cells[r[0]] != " " && cells[r[0]] == cells[r[1]] && cells[r[0]] == cells[r[2]]
    end
    if win_cell
      cells[win_cell[0]]
    else
      nil
    end
  end

  def turn
    player = current_player
    puts "#{player.token} turn!"
    input = player.move(board, self)
    puts "#{player.token} selected #{input}!"
    board.update(input, player)
    board.display
  end

  def play
    board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  # def start
  #
  # end

end
