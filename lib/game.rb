class Game
  include GameStatus::InstanceMethods

  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn
    player = current_player
    current_move = player.move(self.board)
    
    if !board.valid_move?(current_move)
      turn
    else
      puts "Move ##{self.board.turn_count+1}"
      self.board.display
      self.board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      self.board.display
    end
  end

  def play
    while !over?
      self.turn
    end

    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cats Game!"
    end  
  end
end