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

  def select_move(player)
    puts "Player \u001b[31m#{player.token}\u001b[37;1m please select your move"
    puts ""
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

  def cats_game
    puts ""
    puts "\u001b[33mCAT'S GAME!"
    puts ""
    puts "#{board.display} \u001b[37m"
    sleep(3)
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

  def congratulate_winner
    puts ""
    puts "\u001b[31mCONGRATULATIONS #{winner}! YOU'VE WON!"
    puts ""
    puts "#{board.display} \u001b[37m"
    sleep(3)
  end

  def invalid_move
    puts ""
    puts "\u001b[33m Invalid Move \u001b[37m"
    puts ""
    sleep(1)
  end

  def turn
    player = current_player
    select_move(player)
    board.display
    board_move = player.move(board)

    if board.valid_move?(board_move)
      board.update(board_move, player)
    elsif !board.valid_move?(board_move)
      invalid_move
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      cats_game
    else
      congratulate_winner
    end
  end
end
