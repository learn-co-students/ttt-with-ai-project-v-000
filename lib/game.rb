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

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all?{|token| board.cells[token]=="X"} || combo.all?{|token| board.cells[token]=="O"}
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if WIN_COMBINATIONS.detect {|combo| 
      combo.all?{|token| self.board.cells[token]=="X"}}
        return "X"
      
    elsif WIN_COMBINATIONS.detect {|combo|
      combo.all?{|token| self.board.cells[token]=="O"}}
        return "O"   
          
    elsif draw?
      nil
    end
  end

  def turn
    input=current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
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