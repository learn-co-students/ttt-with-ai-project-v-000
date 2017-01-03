class Board
  attr_accessor :cells

  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end



  # position_taken? method
  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    else
      return false
    end
  end

  # valid_move? method here
  def valid_move?(position)
    position = position.to_i - 1
    if !position_taken?(position) && position.between?(0,8)
      return true # position on the board && position not taken
    else
      return false # return false or nil here for invalid move
    end
  end

  # define turn method here
  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
        move(position, current_player)
        display_board
    elsif !valid_move?(position)
      turn
    end
  end

  # define turn_count here
  def turn_count
    counter = 0
    @board.each do |occupied_spot|
      if occupied_spot != " "
        counter += 1
      end
  end
  counter
  end

  # define current_player here
  def current_player
    if turn_count.even? == true
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[1]] == board[win_combo[2]] &&
      (board[win_combo[0]] == "X" || board[win_combo[0]] == "O")
      return win_combo
    else
      false
    end
  end
end

  #define full here - every element on the board contains "X" or "O"
  def full?
    @board.all? {
      |mark| mark == "X" || mark == "O"
    }
  end

  # define draw? here
  def draw?
    !won? && full?
  end

  # over? here - won, is a draw, or full
  def over?
    won? || draw? || full?
  end

  # define winner here
  def winner
    if winner = won?
      return @board[winner.first]
    end
  end

  # define #play here
  def play
    until over?  # until the game is over
     turn   #take turns
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
  end
end
end
