class Game
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],
  [2,5,8],[0,4,8],[6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize p1=Human.new("X"), p2=Human.new("O"), b=Board.new
    @player_1=p1; @player_2=p2; @board=b
  end

  def current_player
    @board.turn_count % 2 == 1 ? @player_2 : @player_1
  end

  def winner
     WIN_COMBINATIONS.each do |c|
        if @board.cells[c[0]]=="X" && @board.cells[c[1]]=="X" && @board.cells[c[2]]=="X"
           return "X"
        elsif @board.cells[c[0]]=="O" && @board.cells[c[1]]=="O" && @board.cells[c[2]]=="O"
           return "O"
        end
      end
      return nil
    end
    
   def won?
       winner!=nil
   end
   
   def over?
       won? || @board.full?
   end
   
   def draw?
       @board.full? && !(won?)
   end
   
   def turn
       s=current_player.move(@board)
       if @board.valid_move?(s)
          @board.update(s, current_player)
       else
          turn
       end
   end

   def play
       while over? == false do
          s=current_player.move(@board)
          @board.update(s, current_player)
          if draw? then puts "Cats Game!"; return end
          if won? then puts "Congratulations #{winner}!"; return end
       end
       if draw? then puts "Cats Game!"; return end
       if won? then puts "Congratulations #{winner}!"; return end
    end
end