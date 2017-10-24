class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2], #top row wins
    [3,4,5], #middle row wins
    [6,7,8], #botom row wins
    [0,3,6], #left column wins
    [1,4,7], #middle column wins
    [2,5,8], #right column wins
    [0,4,8], #diagonal win
    [2,4,6] #diagonal win
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #retruns the current player whose turn it is
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  #returns true if the game is won or if its full
  def over?
    if won? || draw?
      return true
    end
  end

  #returns the winning combnations that won or false
  def won?
   WIN_COMBINATIONS.each do |win_index|
     position_1 = @board.cells[win_index[0]]
     position_2 = @board.cells[win_index[1]]
     position_3 = @board.cells[win_index[2]]

     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_index # return the win_combination indexes that won.
     end
   end
   return false
  end

  #returns true if the game is a draw and false if not
  def draw?
    if @board.full? == true && won? == false
      return true
    else
      return false
    end
  end

  #returns the player token of the winner
  def winner
    if won? == false
      return nil
    else
      win_index = won?
      if @board.cells[win_index[0]] == "X"
        return "X"
      elsif @board.cells[win_index[0]] == "O"
        return "O"
      end
    end
  end

  def turn
    player = current_player
    player_move = player.move(@board) #sets the current players move (stored in variable player) to player_move

    if !@board.valid_move?(player_move)
      turn
    else
      puts "Turn Number: #{@board.turn_count + 1}"
      @board.display
      @board.update(player_move, player)
      puts "Player #{player.token} moved to cell #{player_move}."
      @board.display
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
#end of Game class
end
