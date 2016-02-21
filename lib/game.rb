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
    [6,4,2]
  ]


  def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    board.count{|space| space == "X" || space == "O"}
  end

  def current_player
   if board.turn_count % 2 == 0
     return @player_1
     else
     return @player_2
   end
  end

  def position_taken?(position)
    if board.cells[position] == " " || board.cells[position] == "" || board.cells[position] == nil
      false
    else
      true
    end
  end

  def won?
  WIN_COMBINATIONS.find do |wins|
    board.cells[wins[0]] == board.cells[wins[1]] &&board.cells[wins[1]] == @board.cells[wins[2]] && position_taken?(wins[0])
  end
end

  def full?
    board.cells.all? do |letter|
      letter == "X" || letter == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winner = won?
      board.cells[winner[1]]
    else
      nil
    end
  end

 def valid_move?(position)
      position = position.to_i - 1
      if position_taken?(position) == false && position.between?(0,8) == true
        true
      else
        false
      end
    end


   def turn
      board.display
      position = current_player.move(board)
      if valid_move?(position)
        board.cells[position.to_i - 1] = current_player.token
      else
        puts "invalid entry"
        turn
      end
    end


  def play
    until over?
      turn
    end
    if
      draw?
        puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end



end