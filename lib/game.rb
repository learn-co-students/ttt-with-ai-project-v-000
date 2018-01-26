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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    count = 0
    @board.cells.each do |index|
      if index != "" && index != " " && index != nil
        count +=1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return @player_1
    else return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0])
    end
  end

  def full?
    !@board.cells.any?{|element| element == nil || element == "" || element == " "}
  end

  def over?
    won? || full?
  end

  def draw?
    full? && !won?
  end

  def winner
    if !over? || draw?
      return nil
    elsif combo = won?
      @board.cells[combo[0]]
    end
  end

  # def turn
  #   puts "Please enter a number (1-9):"
  #   index = gets.strip
  #   if @board.valid_move?(index)
  #     if turn_count.even?
  #       @player_1.move(index)
  #     else
  #       @player_2.move(index)
  #     end
  #   else
  #     return "invalid"
  #     turn
  #   end
  # end

  def turn
    puts "Please enter a number (1-9):"
    index = current_player.move(@board)

    if @board.valid_move?(index)
      @board.update(index,current_player.token)
    else
      turn
    end
  end

end
