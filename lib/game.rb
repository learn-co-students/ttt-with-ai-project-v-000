class Game

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?
  count = 0
  while count < 9
    if position_taken?(count) == false
      return false
    end
    count += 1
  end
  return true
end

def draw?
  if full? && !won?
    return true
  else
    return false
  end
end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def winner
  if won?
    win_combination = won?
    if @board[win_combination[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  while !over?
    turn
  end
  if winner == "X"
    puts "Congratulations #{winner}!"
  elsif winner == "O"
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end
