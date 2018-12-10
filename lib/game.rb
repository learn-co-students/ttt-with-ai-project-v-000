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
    if board.turn_count.even? 
        current_player = player_1
      else
        current_player = player_2
      end
  end 
  
  def won?
    WIN_COMBINATIONS.each do |combination|
         if board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[1]] == board.cells[combination[2]] 
              if board.cells[combination[2]] != " "
                  return combination
                else
                  return nil
         end
       end
    end
     !board.full?
    end
    
    def draw?
      won? == false && board.full? 
    end
    
    def over?
      draw? == true || won?.kind_of?(Array) == true
    end
    
    def winner
      win_combo = won?
      board.cells[win_combo[0]] if win_combo != nil
    end
    
    def turn
     # binding.pry
      x = current_player.move(board)
      if board.valid_move?(x)
        board.update(x, current_player) 
      else turn
      end
    end
    
    def play
      current_player.move(board)
      turn
     # binding.pry
      play if over? == false
    end
end