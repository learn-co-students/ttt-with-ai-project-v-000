
class Game

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    player1_token_count = self.board.cells.count {|cell| cell == self.player_1.token}
    player2_token_count = self.board.cells.count {|cell| cell == self.player_2.token}
    player1_token_count > player2_token_count ? self.player_2 : self.player_1
  end
  
  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect { |index| (self.board.cells[index[0]] == self.player_1.token && self.board.cells[index[1]] == self.player_1.token && self.board.cells[index[2]] == self.player_1.token) || (self.board.cells[index[0]] == self.player_2.token && self.board.cells[index[1]] == self.player_2.token && self.board.cells[index[2]] == self.player_2.token) }
  end

  def full?
    self.board.cells.all? { |cell| cell != " " }
  end

  def draw?
    !won? && full?
  end

  def winner
    win_index = won?
    win_index.class == Array ? self.board.cells[win_index[0]] : nil
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !self.board.taken?(input)
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(self.board)
    until valid_move?(input)
      puts "Invalid move! Please enter 1-9:"
      self.board.display
      input = current_player.move(self.board)
    end
    if current_player.class == Players::Computer
      puts input
    end
    self.board.update(input, current_player)
    self.board.display
  end

  def play
    
    self.board.display

    while !over?
      turn
    end

    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end