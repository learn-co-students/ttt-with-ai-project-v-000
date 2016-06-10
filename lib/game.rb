class Game

  WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2 

  def initialize(p1=(Human.new("X")), p2=(Human.new("O")), board=(Board.new))
    @player_1 = p1
    @player_2 = p2
    @board = board
  end
  
  def turn
    index = current_player.move([])
    if @board.valid_move?(index)
      @board.update(index, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
      if won? || draw?
        break
      end
    end
    w = won?
    if w 
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

  def current_player
    count = @board.turn_count
    if count%2==0
      @player_1
    else 
      @player_2
    end
  end

  def over?
    @board.full? || won?
  end

  def draw?
    ans = true
    if !(@board.full?)
      ans = false
    end
    if won?
      ans = false
    end
    ans
  end

  def won?
    won = false 
    WIN_COMBINATIONS.each do |combo|
      i0 = @board.cells[combo[0]]
      i1 = @board.cells[combo[1]]
      i2 = @board.cells[combo[2]]
      if (i0=="X" || i0=="O") && i0==i1 && i0==i2
        return combo
      end
    end
    won
  end

  def winner
    winner = won?
    if winner 
      return @board.cells[winner[0]]
    else 
      return nil
    end
  end

end















