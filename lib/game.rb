class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row

  [0,3,6], #Left column
  [1,4,7], #Middle Column
  [2,5,8], #Right column

  [6,4,2],
  [0,4,8]
  ] 

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2  = player_2
    @board = board
  end

  def current_player
    count = board.cells.count{|turn| turn == "X" || turn == "O"}
    if count % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def won?
    WIN_COMBINATIONS.collect do |winarray|
    win_index_1 = winarray[0]
    win_index_2 = winarray[1]
    win_index_3 = winarray[2]

    position_1 = board.cells[win_index_1]
    position_2 = board.cells[win_index_2]
    position_3 = board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return true # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return true
    end
    end
    false
  end

  def draw?
    won? == false && board.full?
  end

  def over?
    if won? == false && draw? == false
     false
      else
      true
    end
  end

  def winner
    if draw? == true; nil;
    else

    WIN_COMBINATIONS.each do |winarray|
    win_index_1 = winarray[0]
    win_index_2 = winarray[1]
    win_index_3 = winarray[2]

    position_1 = board.cells[win_index_1]
    position_2 = board.cells[win_index_2]
    position_3 = board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winner = "X"
      return winner
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner = "O"
      return winner
    else
      nil
    end
    end
    nil
    end
  end

  def turn
    input = current_player.move(board)
    if @board.valid_move?(input) == true
      @board.update(input, current_player)
    else
      puts "Please enter a valid move."
      current_player.move(board)
    end
  end

  def play
  until self.over?
    self.turn
  end
  if self.won?
    puts "Congratulations #{self.winner}!"
  elsif draw?
    puts "Cats Game!"
  end
  end

end





