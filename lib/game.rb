require 'pry'

class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  attr_accessor :board, :player_1, :player_2
  attr_reader :current_player

  def initialize (player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
    @current_player = @player_1
  end

  def current_player
    turn_number = @board.turn_count
    if turn_number.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    if full? == true || draw? == true || won? != false
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      index_1 = win_combination[0]
      index_2 = win_combination[1]
      index_3 = win_combination[2]
      if (@board.cells[index_1] == "X" && @board.cells[index_2] == "X" && @board.cells[index_3] == "X") || (@board.cells[index_1] == "O" && @board.cells[index_2] == "O" && @board.cells[index_3] == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    if self.won? == false && self.full? == true
      return true
    else
      return false
    end
  end

  def full?
    if @board.cells.include?(" ")
      return false
    else
      return true
    end
  end

  def winner
    won? ? @board.position((won?[0] + 1).to_s) : nil
  end

  def turn
    player_token = current_player.token
    puts "Player #{player_token}, please enter 1-9:"
    user_input = current_player.move(@board)
    index = user_input.to_i - 1
    while @board.valid_move?(user_input) == false && !@board.full?
      puts "Player #{player_token}, please enter 1-9:"
      user_input = current_player.move(@board)
      index = user_input.to_i - 1
    end
    @board.update(user_input, @current_player)
    swap_player
  end

  def swap_player
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def play
    while !over?
      @board.display()
      turn
    end

    if won?
      puts "Congratulations #{self.winner}!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end

  def move(board, input_to_index, player)
    @board[input_to_index] = player
  end
end
