require "pry"

class Computer < Player

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

  def move(board)
    if !board.taken?(5)
        5.to_s
      else
        optimal_move(board)
    end
  end

  def opponent
    self.token == "X" ? "O" : "X"
  end

  def optimal_move(board)
      winning_move(board) || blocking_move(board) || corner_move(board,[1,3,7,9]) || side_move(board,[2, 4, 6, 8])
  end

  def winning_move(board)
    board_cells = board.cells
    winning_combo = winning_combination?(board, self.token)
    if winning_combo
      winning_combo.detect{|index| board_cells == " "}
    end
  end

  def blocking_move(board)
    board_cells = board.cells
    blocking_combo = winning_combination?(board, self.opponent)

    if blocking_combo
      blocking_combo.detect{|index| board_cells == " "}
    end
  end

  def winning_combination?(board,token)
    board_cells = board.cells

    WIN_COMBINATIONS.detect do |position|
      (board_cells[position[0]] == token && board_cells[position[1]] == token) && board_cells[position[2]] == " " ||
      (board_cells[position[0]] == token && board_cells[position[2]] == token) && board_cells[position[1]] == " " ||
      (board_cells[position[1]] == token && board_cells[position[2]] == token) && board_cells[position[0]] == " "
    end
  end


  def corner_move(board,moves_list)
    random_move = choose_random_move(board)
    moves_list.detect {|x| x == random_move}
  end

  def side_move(board,moves_list)
    random_move = choose_random_move(board)
    moves_list.detect {|x| x == random_move}
  end

  def choose_random_move(board)
    possible_moves = []

    board_cells = board.cells

    board_cells.each_with_index do |i,index|
      if i == " "
        possible_moves << index.inspect.to_i
      end
    end

    puts "This is #{possible_moves}"
    puts "#{board_cells[possible_moves.sample]}"
    possible_moves.sample + 1
  end
end
