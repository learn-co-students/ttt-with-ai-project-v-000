class Game

  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[2,5,8],[1,4,7]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
    @player_1=player_1
    @player_2=player_2
    @board=board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| combo.all? {|w| @board.cells[w] == "X"} || combo.all? {|w| @board.cells[w] == "O"}
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
       @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input=current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input,current_player)
    else
      turn
    end
    @board.display
  end

  def play
    until over?
      turn
    end
    if won? && winner =="X"
      puts "Congratulations X!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    else draw?
      puts "Cats Game!"
    end
  end
end
