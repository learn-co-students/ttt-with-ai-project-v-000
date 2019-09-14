require 'pry'
class Players::Computer < Player

  FORK_COMBINATIONS = [
    [[0,1,2],[0,3,6]],
    [[0,1,2],[0,4,8]],
    [[0,1,2],[1,4,7]],
    [[0,1,2],[2,5,8]],
    [[0,1,2],[2,4,6]],
    [[3,4,5],[0,3,6]],
    [[3,4,5],[1,4,7]],
    [[3,4,5],[0,4,8]],
    [[3,4,5],[2,4,6]],
    [[3,4,5],[2,5,8]],
    [[6,7,8],[0,3,6]],
    [[6,7,8],[2,4,6]],
    [[6,7,8],[1,4,7]],
    [[6,7,8],[2,5,8]],
    [[6,7,8],[0,4,8]],
    [[0,3,6],[0,4,8]],
    [[0,3,6],[2,4,6]],
    [[1,4,7],[0,4,8]],
    [[1,4,7],[2,4,6]],
    [[2,5,8],[0,4,8]],
    [[2,5,8],[2,4,6]],
    [[0,4,8],[2,4,6]]
  ]

  def two_taken?(board)
    Game::WIN_COMBINATIONS.detect do |win_index|
      (board.cells[win_index[0]] == " " && board.cells[win_index[1]] != " " && board.cells[win_index[1]] == board.cells[win_index[2]]) ||
      (board.cells[win_index[1]] == " " && board.cells[win_index[0]] != " " && board.cells[win_index[0]] == board.cells[win_index[2]]) ||
      (board.cells[win_index[2]] == " " && board.cells[win_index[0]] != " " && board.cells[win_index[0]] == board.cells[win_index[1]])
    end
  end

  def win_or_block(board)
    empty_cell = two_taken?(board).detect {|cell| board.cells[cell] == " "}
    next_move = empty_cell + 1
    next_move.to_s
  end

  def two_empty?(board, win_index)
    (board.cells[win_index[0]] == " " && board.cells[win_index[1]] == " " && board.cells[win_index[2]] != " ") ||
    (board.cells[win_index[1]] == " " && board.cells[win_index[2]] == " " && board.cells[win_index[0]] != " ") ||
    (board.cells[win_index[2]] == " " && board.cells[win_index[0]] == " " && board.cells[win_index[1]] != " ")
  end

  def fork_taken?(board, win_index)
    win_index.detect {|cell| board.taken?(cell + 1)}
  end

  def fork_move(board)
    #if two win_indicies share a cell,
    #and the shared cell is empty,
    #and another cell in each win index is empty,
    #and the other cell in the win indecies is occupied by the same player,
    #then the current player should take the empty shared cell
    empty_cell = nil
    FORK_COMBINATIONS.each do |combo|
      if board.cells[(combo[0] & combo[1]).first] == " " && two_empty?(board, combo[0]) && two_empty?(board, combo[1]) && board.cells[fork_taken?(board, combo[0])] == board.cells[fork_taken?(board, combo[1])]
        empty_cell = ((combo[0] & combo[1]).first + 1).to_s
      end
    end
    empty_cell
  end

  def one_taken?(board)
    Game::WIN_COMBINATIONS.detect do |win_index|
      (board.cells[win_index[0]] == " " && board.cells[win_index[1]] == " " && board.cells[win_index[2]] == "#{@token}") ||
      (board.cells[win_index[1]] == " " && board.cells[win_index[2]] == " " && board.cells[win_index[0]] == "#{@token}") ||
      (board.cells[win_index[2]] == " " && board.cells[win_index[0]] == " " && board.cells[win_index[1]] == "#{@token}")
    end
  end

  def offensive_move(board)
    (one_taken?(board).detect {|cell| board.cells[cell] == " "} + 1).to_s
  end

  def move(board)
    #binding.pry
    board.display
    puts " "
    puts "Player #{@token}'s turn:"

    if board.turn_count == 0
      "1"
    elsif board.turn_count == 1 && !board.taken?(5)
      "5"
    elsif board.turn_count == 1 && !board.taken?(1)
      "1"
    elsif board.turn_count == 2 && (board.taken?(2) || board.taken?(3))
      "4"
    elsif board.turn_count == 2 && (board.taken?(4) || board.taken?(5) || board.taken?(7))
      "2"
    elsif board.turn_count == 2 && board.taken?(6)
      "5"
    elsif board.turn_count == 2 && (board.taken?(8) || board.taken?(9))
      "3"
    # elsif board.turn_count == 4 && board.cells[0,3] == "X" && !board.taken?(7)
    #   "7"
    # elsif board.turn_count == 4 && board.cells[0,3] == "X" && !board.taken?(5)
    #   "5"
    # elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(3)
    #   "3"
    # elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(5)
    #   "5"
    # elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(7)
    #   "7"
    # elsif board.turn_count == 4 && board.cells[0,4] == "X" && !board.taken?(9)
    #   "9"
    # elsif board.turn_count == 4 && board.cells[0,4] == "X" && !board.taken?(3)
    #   "3"
    # elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(2)
    #   "2"
    # elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(8)
    #   "5"
    # elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(9)
    #   "7"
    # elsif board.turn_count == 6 && board.cells[0,3,4] == "X" && !board.taken?(6)
    #   "6"
    # elsif board.turn_count == 6 && board.cells[0,3,4] == "X" && !board.taken?(9)
    #   "9"
    # elsif board.turn_count == 6 && board.cells[0,1,4] == "X" && !board.taken?(8)
    #   "8"
    # elsif board.turn_count == 6 && board.cells[0,1,4] == "X" && !board.taken?(9)
    #   "9"
    # elsif board.turn_count == 6 && board.cells[0,1,6] == "X" && !board.taken?(4)
    #   "4"
    # elsif board.turn_count == 6 && board.cells[0,1,6] == "X" && !board.taken?(6)
    #   "6"
    # elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(2)
    #   "2"
    # elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(7)
    #   "7"
    # elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(9)
    #   "9"
    # elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(2)
    #   "2"
    # elsif board.turn_count == 6 && board.cells[0,2,6] == "X" && !board.taken?(4)
    #   "4"
    # elsif board.turn_count == 6 && board.cells[0,2,6] == "X" && !board.taken?(5)
    #   "5"
    # elsif board.turn_count == 8
    #   rand(8..9).to_s
    elsif two_taken?(board)
      win_or_block(board)
    elsif fork_move(board) != nil
      fork_move(board)
    elsif one_taken?(board)
      offensive_move(board)
    else
      rand(1..9).to_s
    end
  end


end

#FORK_COMBINATIONS.detect {|combo| board.cells[(combo[0] & combo[1]).to_s.to_i] == " " && two_empty?(board, combo[0]) && two_empty?(board, combo[1]) && board.cells[fork_taken?(combo[0])] == board.cells[fork_taken?(combo[1])] }
