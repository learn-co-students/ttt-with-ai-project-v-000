class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # left vertical row
    [1,4,7], # middle vertical row
    [2,5,8], # right vertical row
    [0,4,8], # top left to bottom right row
    [6,4,2]  # bottom left to top right row
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(position, player = current_player)
    @board[position.to_i - 1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    if (position_taken?(position.to_i - 1) == false) && (position.to_i.between?(1,9) == true)
    true
    else (position_taken?(position.to_i - 1) == true) || (position.to_i.between?(1,9) == false)
    false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input) == true
      puts "valid move"
      move(input)
      display_board
    elsif valid_move?(input) == false
      puts "invalid move"
      turn
    end
  end

  def turn_count
    @board.count{ |i| i == "X" || i == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_pos1 = combo[0]
      win_pos2 = combo[1]
      win_pos3 = combo[2]

      position1 = @board[win_pos1]
      position2 = @board[win_pos2]
      position3 = @board[win_pos3]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? { |i| i == "X" || i == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    if full? || won? || draw?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
