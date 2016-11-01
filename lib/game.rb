class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]]

  def initialize(player1=Players::Human.new('X'), player2=Players::Human.new('O'), board=Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def turn_count
    count = 0
    @board.cells.each do | c |
      if c == 'X' || c == 'O'
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wc|
      if wc.all?{|c| board.cells[c] == "X"} || wc.all?{|c| board.cells[c] == "O"}
        return wc
      end
    end
    return false
  end

  def full?
    !board.cells.any? {|c| c == " " || c == ""}
  end

  def draw?
    return full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    n = current_player.move(board)
    if !board.valid_move?(n)
      puts "The board runs left to right, top to bottom. Please choose a free space, 1 - 9. "
      turn
    end
    @board.update(n, current_player)
    @board.display
  end

  def play
    until over?
      puts "Player #{current_player.token}'s turn:"
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome to TicTacToe!"
    puts "Choose 0, 1 or 2 players — or watch a 'wargame'."
    n = gets.chomp

    if n == "wargame"
      wargame
    elsif n.to_i == 0
      computer1 = Players::Computer.new('X')
      computer2 = Players::Computer.new('O')
      board = Board.new
      game = Game.new(computer1, computer2, board)
    elsif n.to_i == 1
      player_1 = Players::Human.new('X')
      computer2 = Players::Computer.new('O')
      board = Board.new
      game = Game.new(player_1, computer2, board)
    else
      player1 = Players::Human.new('X')
      player2 = Players::Human.new('O')
      board = Board.new
      game = Game.new(player1, player2, board)
    end
    puts "Got it! Let's play."
    board.display
    game.play
  end

  def wargame
    n = 1
    result = []
    while n <= 5
      puts "starting n= " + n.to_s
      g = gets
      computer1 = Players::Computer.new('X')
      computer2 = Players::Computer.new('O')
      board = Board.new
      game = Game.new(computer1, computer2, board)
      game.play
      puts winner
      result << "#{n.to_s} : #{winner}"
      n += 1
    end
    board.reset!
    board = nil
    game = nil
    computer1 = nil
    computer2 = nil
    puts result.to_s
    puts n
  end
  
end
