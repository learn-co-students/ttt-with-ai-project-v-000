class Game

attr_accessor:board,:player_1,:player_2


WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]


  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    if won? || draw?
        true
        else 
        false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        p1 =  @board.cells[win_index_1] # load the value of the board at win_index_1
        p2 =  @board.cells[win_index_2] # load the value of the board at win_index_2
        p3 =  @board.cells[win_index_3] # load the value of the board at win_index_3
        
        if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
            return win_combination # return the win_combination indexes that won.
        end
    end
    return false
  end

def full?
    @board.cells.all? do |space|
        space == "X" || space == "O"
    end
end


  def draw?
    if !won? && full?
        true
    end
  end


  def winner
    win = won?  
    return  @board.cells[win[0]] if win
  end


def turn
    loop do
      puts "it's player #{current_player.token}'s turn now"
      move = current_player.move(board)
      if @board.valid_move?(move)
        @board.update(move, current_player)
        @board.display
        break
      end
      puts 'move is invalied, please enter a different number'
    end
  end


def play
    until over?
        turn
    end
    if won?
        puts "Congratulations #{winner}!"
        elsif draw?
        puts "Cats Game!"
    end
  end
end