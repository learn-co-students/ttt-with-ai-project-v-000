#requre_all "players"

class Game
  attr_accessor :board, :player_1, :player_2
  include MiniMax
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1=player_1
    @player_2=player_2
    @board=board

  end

  def current_player
    return @player_1 if @board.turn_count%2==0
    return @player_2
  end

  def over?
    @board.full? || won? || draw?
  end


  def draw?
    @board.full? && !won?
  end

  def won?
  WIN_COMBINATIONS.detect { |combination|
    @board.cells[combination[0]]==@board.cells[combination[1]] && @board.cells[combination[1]]==@board.cells[combination[2]] && @board.cells[combination[1]]!=" "
  }
  end

  def winner
    if !won?
        return nil
    end
    return @board.cells[won?[0]]
  end

  def turn
    index=current_player.move(board)
    if @board.valid_move?(index)
        @board.update(index, current_player)
        @board.display
      else
        turn
      end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    @board.display
    until over? do
      turn
    end

    if won?
       puts "Congratulations #{winner}!"
       puts "Your score: #{score}"
     end

     if draw?
       puts "Cat's Game!"
     end
  end

end

#Game.new.tap{|g| g.play}
