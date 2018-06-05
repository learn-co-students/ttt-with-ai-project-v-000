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
    [2,4,6]]
    

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    
    def current_player
       @board.turn_count.odd? ? @player_2 : @player_1
    end 
    
    def won?
      WIN_COMBINATIONS.detect do |a|
        self.board.cells[a[0]] ==  self.board.cells[a[1]] &&
        self.board.cells[a[1]] ==  self.board.cells[a[2]] &&
        self.board.cells[a[0]] != " "
      end 
    end 
    
    def draw?
      self.board.full? && !won?
    end 
    
    def over?
     draw? || won?
    end 
    
    def winner
      if won?
        winner = won?
      self.board.cells[winner[0]]
      else
        nil
      end 
    end 
    
    def turn
      puts "Now it's #{current_player.token}'s turn!"
      input = current_player.move(board)
      if self.board.valid_move?(input)
        self.board.update(input, current_player)
      else
        puts "That move does not fly. Try again"
       turn
      end
      self.board.display
    end 
    
    def play 
      until over?
       turn 
      end 
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end 

end 