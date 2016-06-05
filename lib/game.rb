class Game
  include SharingIsCaring

  attr_accessor :board, :player_1, :player_2, :current_player

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


  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @current_player = @player_1
    else
      @current_player = @player_2
    end
  end

  def over?
   draw? || won? ? true : false
  end

  def won?
    return false if @board.cells.include?("X") == false && @board.cells.include?("O") == false
    WIN_COMBINATIONS.each do |x|
      if @board.cells[x[0]] == "X" && @board.cells[x[1]] == "X" && @board.cells[x[2]] == "X"
        return "X"
      elsif @board.cells[x[0]] == "O" && @board.cells[x[1]] == "O" && @board.cells[x[2]] == "O"
        return "O"
      end
    end
    return false
  end


  def full?
    @board.cells.each do |x|
      if x == " "
        return false
      end
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    end
    return false
  end


  def winner
    if !won?
      return nil
    end
    return won?
  end


  def turn
    puts "Current player is #{current_player.token} (#{current_player.class})."
    puts ""
    move = current_player.move(@board)
    if @board.valid_move?(move)
      board.update(move, current_player)
    else
      puts "invalid input"
      puts ""
      turn
    end

  end


  def play
    while !over?
      @board.display
      puts ""
      turn
      puts ""
    end
    @board.display
    puts " "
    puts " "
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
    puts " "
    puts " "
  end



end