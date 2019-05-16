require "pry"
class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  attr_accessor :board, :player_1, :player_2, :winner
  def initialize(player_1 = Players::Human.new("X"), player_2 =  Players::Human.new("O"), board = Board.new)
    # player_1 = Human.new("X")
    # player_2 = Human.new("O")
    @player_1 = player_1
    @player_2 = player_2
    @board = board

  end

  def current_player
    return @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end





  def over?
    full?
  end

  def won?
    if winner != nil
      true
    elsif full?
      false
    end
    # win_x = []
    # win_o = []
    # WIN_COMBINATIONS.each do |win_array|
    #   win_x = win_array.select do |win_sequence|
    #     @board.cells[win_sequence] == "X"
    #   end
    #   if win_x.size == 3
    #     self.winner = "X"
    #     return true
    #   end
      # win_o = win_array.select do |win_sequence|
      #   @board.cells[win_sequence] == "O"
      # end
      # if win_o.size == 3
      #   self.winner = "O"
      #   return true
      # end
    # end
    # if over?
    #   return false
    # end
  end

  def full?
    @board.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win_array|
      win_x = win_array.select do |win_sequence|
        @board.cells[win_sequence] == "X"
      end
      if win_x.size == 3
        return @winner = "X"
      end
      win_o = win_array.select do |win_sequence|
        @board.cells[win_sequence] == "O"
      end
      if win_o.size == 3
        return @winner = "O"
      end
    end
    nil
  end

  def turn
    input = current_player.move(@board)
    # binding.pry
    if !@board.valid_move?(input)
       turn
    else
      @board.update(input, current_player)

      @board.display
      # turn
    end
  end

  def play
    until over? || won? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
