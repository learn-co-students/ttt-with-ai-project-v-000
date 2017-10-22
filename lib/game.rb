require_relative "../config/environment.rb"
require "pry"
class Game
  attr_accessor :player_1, :player_2, :board
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
  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if(board == nil)
      @board = Board.new
    else
      @board = board
    end
    if(player_1 == nil)
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    else
      @player_1 = player_1
      @player_2 = player_2
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(normalized_index, current_player)
    @board.cells[normalized_index.to_i - 1] = current_player.token
  end

  def turn
    u_input = current_player.move(@board)

    if @board.valid_move?(u_input)
      move(u_input, current_player)
      @board.display
    else
      turn
    end
  end

  # Define your play method below
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    win_combo = [" "," "," "]
    WIN_COMBINATIONS.each do |combo|
      if((@board.cells[combo[0]] == "X" &&
        @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X") ||
        (@board.cells[combo[0]] == "O" &&
          @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"))
        win_combo[0] = combo[0]
        win_combo[1] = combo[1]
        win_combo[2] = combo[2]
        return win_combo
      end
    end
    return nil
  end

  def full?
    @board.cells.each do |cell|
      if(cell != "X" && cell != "O")
        return false
      end
    end
    return true
  end

  def draw?
    if(!won? && full?)
        return true
    end
    return false
  end

  def over?
    if(won? || draw?)
      return true
    end
    return false
  end

  def winner
    win_combo = won?
    if(win_combo != nil)
      return @board.cells[win_combo[0]]
    end
    return nil
  end


  def play
    until over?
      turn
    end

    if(won?)
      puts "Congratulations #{winner[0]}!"
    else
      puts "Cat's Game!"
    end
  end
end
