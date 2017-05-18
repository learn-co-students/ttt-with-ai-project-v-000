class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    display_board
  end

  def board
    @board
  end

  def board=(board)
    @board = board
  end


  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right row
    [0,4,8],  # First diagonal
    [2,4,6]  # Second diagonal
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(index)
    index = index.to_i
    index = index - 1
  end

  def move(index, player = "X")
    board[index] = player
  end

  def position_taken?(index)
    if board[index] == "X" || board[index] == "O"
      true
    else
      if board[index] == "" || board[index] == " " || board[index] == nil
        false
      end
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    else
      if index.between?(0, 8)
        true
      end
    end
  end

  def turn
    player = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    valid_move?(index) ? move(index, player) : turn
    display_board
  end

  def turn_count
    counter = 0
    board.each do |turn_number|
      if turn_number == "X" || turn_number =="O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|y| board[y] == "X"} || win_combination.all?{|y| board[y] == "O"}
        return win_combination
      end
    end
    return false
  end

  def full?
    board.all?{|i| i == "X" || i == "O"} ? true : false
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won? != false ? true : false
  end

  def winner
    won? == false ? nil : (board[won?[0]] == "X" ? "X" : "O")
  end

  def play
    while !over?
      turn
    end
    draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
  end

end
