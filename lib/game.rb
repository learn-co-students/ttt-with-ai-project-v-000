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
  [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    self.board.cells.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? { |position| self.board.cells[position] == "X" } || win_combo.all? { |position| self.board.cells[position] == "O" }
    end
  end

  def over?
   won? || draw? || board.full?
  end

  def draw?
    board.full? && !won?
  end

  def winner
    winner = won?
    return nil if !winner
    winner.each do |i| 
      return "X" if self.board.cells[i] == "X"
      return "O" if self.board.cells[i] == "O"
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !self.board.valid_move?(current_move)
      puts "Invalid move"
      turn
    else
     puts "Turn: #{self.board.turn_count+1}\n"
      self.board.display
      self.board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      self.board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end