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
    [6,4,2] ]
    
    def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new )
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    
    def current_player
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end
    
    def won?
      WIN_COMBINATIONS.each{|combination| return combination if combination.all?{|cell| @board.cells[cell] == "X"} || combination.all?{|cell| @board.cells[cell] == "O"}}
      return false
    end
    
    def draw?
      return true if won? == false && @board.full?
      return false
    end
    
    def over?
      won? || draw?
    end
    
    def winner
      return @board.cells[won?[0]] if won?
    end
    
    def turn
      move = current_player.move(@board)
      until @board.valid_move?(move) do
        move = current_player.move(@board)
      end
      @board.update(move, current_player)
    end
    
    def play
      @board.display
      until over? do
        turn
        @board.display
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
end