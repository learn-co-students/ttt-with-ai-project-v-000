class Game
  
  attr_accessor :board, :player_1, :player_2, :save_winner
  
  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
  ]
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def winning_player
    @board.turn_count % 2 != 0 ? @player_2.token : @player_1.token
  end
  
  def over?
    won? || draw?
  end
  
  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      win_combo1 = self.board.cells[win[0]]
      win_combo2 = self.board.cells[win[1]]
      win_combo3 = self.board.cells[win[2]]

      if win_combo1 == "X" && win_combo2 == "X" && win_combo3 == "X"
        won = true
        self.save_winner = self.board.cells[win[0]]
      elsif win_combo1 == "O" && win_combo2 == "O" && win_combo3 == "O"
        won = true
        self.save_winner = self.board.cells[win[0]]
      end
    end
    won
  end
  
  def full?
    !@board.cells[0..8].any? {|move| move == "" || move == " "}
  end

  def draw?
    !won? && full? ? true : false
  end
  
  def winner
    self.save_winner if won?
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display
    else
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    won? ? (puts "Congratulations #{self.save_winner}!") : (puts "Cats Game!")
  end
  
end