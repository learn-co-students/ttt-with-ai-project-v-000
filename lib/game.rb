class Game 

  attr_accessor :board, :player_1, :player_2

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

  def board
    @board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
     combo.all? {|position| board.cells[position] == "X"} || combo.all? {|position| board.cells[position] == "O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  
  def winner
   if won?
     board.cells[won?.first]
   end
  end
  
  def turn 
      puts "#{current_player} it's your turn!"
      input = current_player.move(board)
      sleep 1
      if board.valid_move?(input)
        board.update(input, current_player)
      else
        self.turn
    end 
  end

 def play
   until over? 
      turn
   end
    if draw? 
      puts "Cats Game!"
    elsif won? 
      puts "Congratulations #{winner}!"
    end
  end

end







