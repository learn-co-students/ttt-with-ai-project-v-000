class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],  #Top row
    [3,4,5],   #Middle row
    [6,7,8],   #Bottom Row
    [0,3,6],   #Left Column
    [1,4,7],   #Middle Column
    [2,5,8],   #Right Column
    [0,4,8],   #Diagonal 
    [6,4,2]    #Diagonal
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end  

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      if (board.cells[win_combination[0]] == "X" || board.cells[win_combination[0]] == "O") && board.cells[win_combination[0]] == board.cells[win_combination[1]] && board.cells[win_combination[1]] == board.cells[win_combination[2]]
        true
      end
    end
  end

  def draw?
    if board.full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if won? == true || draw? == true
      true
    else 
      false
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |winner|
      if board.cells[winner[0]] == "X" && board.cells[winner[1]] == "X" && board.cells[winner[2]] == "X"
        return "X"
      elsif board.cells[winner[0]] == "O" && board.cells[winner[1]] == "O" && board.cells[winner[2]] == "O"
        return "O"
      end
    end
  end

  def turn 
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    elsif !board.valid_move?(input)
      turn
    end
    board.display
  end

  def play
    until over?
      turn
    end
    if won? == true
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cats Game!"
    end   
  end


end