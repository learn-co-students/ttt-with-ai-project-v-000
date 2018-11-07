class Game

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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.cells.select {|c| c == "X" || c == "O"}.size.even? ? player_1 : player_2
  end

  def won?
    win_pos = []
    WIN_COMBINATIONS.each do |p|
      if board.cells[p[0]] == "X" && board.cells[p[1]] == "X" && board.cells[p[2]] == "X"
        win_pos = p
      elsif board.cells[p[0]] == "O" && board.cells[p[1]] == "O" && board.cells[p[2]] == "O"
        win_pos = p
      end
    end
    win_pos unless win_pos == []
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    board.display
    puts ""
    puts "Player #{current_player.token}, please enter 1-9:"
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    else
      puts ""
      puts "#{current_player.token} - you moved to box #{input}!"
      puts ""
      board.update(input, current_player)
      puts ""
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    board.display
    puts ""
  end

end
