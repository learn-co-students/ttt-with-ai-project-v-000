class Game
  attr_reader :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def initialize(*args)
    @board = args[2]
    @player_1 = args[0]
    @player_2 = args[1]
    if args == []
      @player_1 = Players::Human.new(token = "X")
      @player_2 = Players::Human.new(token = "O")
      @board = Board.new
    end
  end

  def board=(board)
    @board = board
  end

  def player_1=(player)
    @player_1 = player
  end

  def player_2=(player)
    @player_2 = player
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    elsif @board.turn_count.odd?
      @player_2
    end
  end

  def over?
    if @board.full? || draw? || won?
      true
    else
      false
    end
  end

  def won?
    array = WIN_COMBINATIONS.map do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        true
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        true
      else
        false
      end
    end
    if array.include?(true)
      true
    else
      false
    end
  end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end

  def winner
    if won?
      array = WIN_COMBINATIONS.map do |combo|
        if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
          "X"
        elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
          "O"
        end
      end
      if array.include?("X")
        "X"
      else
        "O"
      end
    end
  end

  def turn
    player = current_player
    player_move = player.move(board)
    if !board.valid_move?(player_move)
      turn
    else
      board.display
      board.update(player_move, player)
      board.display
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
