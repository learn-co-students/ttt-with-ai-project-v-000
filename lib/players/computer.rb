require_relative '../player.rb'

class Computer < Player
   attr_accessor :player, :choice, :board
   include GameCheck

  def player_1
    'X'
  end

  def player_2
    'O'
  end


  def move(board)
    @board = board
    get_best_move.to_s
  end


  # Min/Max Algorithm: For every turn, analyzes all possible moves
  # and returns the move with the highest score for the current player.
  # Algorithm implemented with help from source code at https://github.com/mnewsome/TicTacToe_ruby

  def get_best_move(depth=0, best_score={})
    return 0 if draw?
    return -1 if over?

    possible_moves.each do |space|
      update(space, next_player)
      best_score[space] = -1 * get_best_move(depth + 1, {})
      reset_space(space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move + 1
    elsif depth > 0
      return highest_minimax_score
    end
  end

  def possible_moves
    empty_spaces = []
    board.cells.each_with_index {|cell, index| empty_spaces << index if cell == ' '}
    empty_spaces
  end

  def get_new_state(poss)
    poss += 1
    update(poss, winner)
  end


  def update(pos, player)
    board.cells[pos] = current_player
    board
  end

  def reset_space(space)
    board.cells[space] = " "
  end

  def next_player
    if current_player == player_1
      return player_2
    else
      return player_1
    end
  end

end





