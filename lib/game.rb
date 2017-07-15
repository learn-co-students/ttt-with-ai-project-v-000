class Game

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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? {|pos| @board.position(pos+1)=="X"}
      return combo if combo.all? {|pos| @board.position(pos+1)=="O"}
    end
    false
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    flag = false
    while !flag
      input = current_player.move(@board).to_i
      if @board.valid_move?(input)
        @board.update(input,current_player)
        flag = true
      else
        puts "Invalid move, try again!"
      end
    end
  end

  def play
    while !over?
      @board.display
      turn
    end
    if won?
      if winner == "X"
        @board.display
        puts "Congratulations X!"
      elsif winner == "O"
        @board.display
        puts "Congratulations O!"
      end
    end
    if draw?
      @board.display
      puts "Cat's Game!" if draw?
    end
  end

end
