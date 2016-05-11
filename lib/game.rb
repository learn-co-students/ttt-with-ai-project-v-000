class Game
          WIN_COMBINATIONS = 
          [[0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [6,4,2]]


          attr_accessor :board, :player_1, :player_2

    def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      if board.turn_count % 2 == 0
        player_1
      else
        player_2
      end
    end
    
    def over?
      won? || draw?
    end

    def won?
      WIN_COMBINATIONS.detect{|x|
        board.cells[x[0]] == board.cells[x[1]] && board.cells[x[1]] == board.cells[x[2]]
      }
    end  

    def draw?
      !won? && board.full?
    end

    def winner
      if !won? || draw?
        return nil
      else
      board.cells[won?[0]]
      end
    end

    

end

#detect for X - get an array of trues where X are. 
#.each_with_index = put the indexes. match them with the win combinations 

#self.board.cells.each_with_index{|x,index| if x == "X"
#variable << index
#end } 

