class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn_count
    self.board.cells.count{|x|x != " "}
  end

  def current_player
    if turn_count.even?
      return self.player_1
    else return self.player_2
    end
  end


  def won?
    WIN_COMBINATIONS.detect do|win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = self.board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = self.board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = self.board.cells[win_index_3] # load the value of the board at win_index_3
    (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end

  def full?
    self.board.cells.all? do |s|
      s != " "
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?|| full?
      true
    else
      false
    end
  end

  def winner
    if !won?
      return nil
    else
    position = won?[0]
    return self.board.cells[position]
    end
  end


  def turn
      current_player.move_play(self.board)
  end

  def play
   while !over?
     turn
   end
   if draw?
     puts "Cat\'s Game!"
   else
     puts "Congratulations #{winner}!"
   end
 end


end
