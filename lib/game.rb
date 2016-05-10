class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(first_player = Player::Human.new("X"), second_player = Player::Human.new("O"), board = Board.new)
    @player_1 = first_player
    @player_2 = second_player
    @board = board
  end

  def current_player
    count = 0
    @board.cells.each do |position|
      if position == "X" || position == "Y"
        count += 1
      end
    end
    if count % 2 == 0
      player_2
    else
      player_1
    end
  end

  def over?
    over = true
    over = false unless board.cells.detect{|x| x == " "} == nil
    over
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |x|
      if @board.cells[x[0]] == "X" && @board.cells[x[1]] == "X" && @board.cells[x[2]] == "X" || @board.cells[x[0]] == "O" && @board.cells[x[1]] == "O" && @board.cells[x[2]] == "O"
        won = true
      end
    end
    won
  end

  def draw?
    @board.full? == true && won? == false
  end

  def winner
    if won?
      current_player.token
    end
  end

  def turn
    #@board.display
    puts "Please enter 1-9:"
    user_input = current_player.move(@board)
    #if @board.valid_move?(user_input) == false
      #turn
    #end
    user_input = 1
    @board.update(user_input, current_player)
    @board.display
  end
