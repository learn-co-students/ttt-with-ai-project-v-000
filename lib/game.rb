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
      WIN_COMBINATIONS.each do |check|
      win_index_1 = check[0]
      win_index_2 = check[1]
      win_index_3 = check[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true
      end
      end
        return false
    end

    def draw?
      !won? && board.full?
    end

    def winner  
      if won? == true
       winning_combo = WIN_COMBINATIONS.detect{|x| board.cells[x[0]] == board.cells[x[1]] && board.cells[x[1]] == board.cells[x[2]]
      }
      board.cells[winning_combo[0]]
      else
      return nil
      end
    end

    def turn
      move_location = player_1.move(board)
      if !board.valid_move?(move_location)
        turn     
      end
      board.update(move_location,player_1.token)  
    end
    #takes input
    #check if valid input
    #if not valid, ask for input again. 
    #if valid, then make a move / update with that
    #change to next players turn
#Possibly the stubbing in the test. 
#It might be expecting player_one to receive the method turn or something and you are calling it on the other player instead.
    

end

#detect for X - get an array of trues where X are. 
#.each_with_index = put the indexes. match them with the win combinations 

#self.board.cells.each_with_index{|x,index| if x == "X"
#variable << index
#end } 

