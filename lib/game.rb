class Game
  
  attr_accessor :board, :player_1, :player_2, :token
  
  WIN_COMBINATIONS=[
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ]
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even? 
        curr_player = player_1
      else
        curr_player = player_2
      end
      curr_player
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
          @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]] && @board.cells[combination[1]] != " "
    end
  end

    
    def draw?
      !won? && @board.full? 
    end
    
    def over?
      draw? || won? 
    end
    
    def winner
    #  binding.pry
         @board.cells[won?.first] if won?
    #  binding.pry
    end
    
    def turn
      player = current_player
      moves = player.move(@board)
      if !@board.valid_move?(moves)
        turn
      else 
        @board.update(moves, player) 
      end
    end
    
    def play
      while !over? 
        turn
      end
      if won? 
    #    binding.pry
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end
