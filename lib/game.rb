
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    #horizontal wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertial wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal wins
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Player::Human.new(@first = "X"), player_2 = Player::Human.new(@second = "O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def draw?
    self.board.full? == true && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[1]] == self.board.cells[win[2]] && self.board.taken?(win[0]+1)
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winner = won?
      self.board.cells[winner[0]]
    end
  end

  def turn
    puts "#{self.current_player.token}'s move:"
    player_turn = self.current_player.move(board)
    until self.board.valid_move?(player_turn)
      puts "Sorry. Move must be valid."
      player_turn = self.current_player.move(board)
    end
    self.board.update(player_turn, current_player)
  end

  def play
    until over?
      turn
      self.board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
