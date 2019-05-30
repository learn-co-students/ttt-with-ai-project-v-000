class Game
  attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Mid row
    [6,7,8], # Btm row
    [0,3,6], # L columns
    [1,4,7], # M columns
    [2,5,8], # R columns
    [0,4,8], # R diagonal
    [6,4,2]  # L diagonal
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def board
      @board
    end

    def player_1
      @player_1
    end
    def player_2
      @player_2
    end


  def current_player
    count = 0
    self.board.cells.each do |board|
      if board != " "
        count += 1
      end
      end
      @board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
  WIN_COMBINATIONS.each do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    pos_1 = self.board.cells[index_1]
    pos_2 = self.board.cells[index_2]
    pos_3 = self.board.cells[index_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return win_combo
    end
    end
    return false
  end

def full?
  self.board.cells.each do |i|
    if i == " "
      return false
    end
  end
    return true
end

def draw?
 full? && !won?
end

def over?
  if won? != false
    return true
  end
return draw?
end

def winner
  win_combo = won?
  won? ? self.board.cells[win_combo[0]] : nil
end

  def turn
  player = current_player
    move = player.move(@board)
      if @board.valid_move?(move)
         @board.update(move, player)
         @board.display
         puts "\n"

      else
        turn
      end
  end



  def play
    until over? == true
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end


end
