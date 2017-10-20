class Game
  attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
      [0, 1, 2],  [0, 3, 6],  [0, 4, 8],
      [3, 4, 5],  [1, 4, 7],  [2, 4, 6],
      [6, 7, 8],  [2, 5, 8]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
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

  def over?
    if board.full? == true
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|value| @board.cells[value] == "X"}
        return combo
      elsif combo.all? {|value| @board.cells[value] == "O"}
        return combo
      end
    end
    false
  end


  def draw?
    if self.over? && self.won? == false
      return true
    end
  end

  def winner
    if self.won? != false
      index = self.won?[0]
      @board.cells[index]
    end
  end

  def turn
    input = current_player.move(@board).to_i
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      puts "This is invalid. Please try again."
      turn
    end
  end

  def play
    until won? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      return
    else
      puts "Cat's Game!"
      return
    end
  end

end
