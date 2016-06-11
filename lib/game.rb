class Game
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1  
    @player_2 = player_2
    @board = board
  end

  def current_player
   board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    position_1 = board.cells[win_combination[0]]
    position_2 = board.cells[win_combination[1]]
    position_3 = board.cells[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    board.cells.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    full? == true && won? == false
  end

  def over?
    won? != false || draw? == true
  end

  def winner
    winning_array = won?
    if winning_array != false
      return board.cells[winning_array.first]
    else
      return nil
    end
  end

  def move(position, character="X")
   board[position.to_i - 1]=character
  end

  def position_taken?(position)
    (board.cells[position] != " " && board.cells[position] != "" && board.cells[position] != nil)
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      board.update(input, self.current_player)
      self.board.display
    else
      turn
    end
  end

  def turn_count
    counter = 0
    board.cells.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
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