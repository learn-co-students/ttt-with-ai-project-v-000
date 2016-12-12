require 'pry'
class Computer < Player

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def opponent_token
    my_token = self.token
    my_token == "X" ? opponent_token = "O" : opponent_token = "X"
  end

  def move(board)
    while true
      puts "******* next move *********"
      next_move = ai_move(board)
      return next_move if board.valid_move?(next_move)
    end
  end # end #move

  def random_move(board)
    board.valid_moves.sample
  end

  # Checks for two in a row, given a board and a token, and returns the array index
  # of the third spot, if it's empty?  If it's occupied, return nil
  def two_in_a_row?(board, player_token = self.token)  # pass opponent_token to override.
    WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS
      # check if any of the winning combinations are occupied by the player_token
      if board.cells[combination[0]] == player_token || board.cells[combination[1]] == player_token || board.cells[combination[2]] == player_token
        if board.cells[combination[0]] == board.cells[combination[1]] && !board.taken?(combination[2], "array perspective")
          return combination[2]
        elsif board.cells[combination[0]] == board.cells[combination[2]] && !board.taken?(combination[1], "array perspective")
          return combination[1]
        elsif board.cells[combination[1]] == board.cells[combination[2]] && !board.taken?(combination[0], "array perspective")
          return combination[0]
        end
      end
    end
    nil
  end

  # See if there are any available moves in the same row or column as an already placed token?
  # If so, return one (or both?) of those moves
  def same_row_or_column(board, player_token = self.token)
    next_move = 99
    # if player_token is in a WIN_COMBINATIONS space, look for player_token in the other two spaces.
    WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS
      if board.cells[combination[0]] == player_token
        if !board.taken?(combination[1], "array perspective") && !board.taken?(combination[2], "array perspective")
          rand >= 0.5 ?  next_move = combination[1] :  next_move = combination[2]
        end
      elsif board.cells[combination[1]] == player_token
        if !board.taken?(combination[0], "array perspective") && !board.taken?(combination[2], "array perspective")
          rand >= 0.5 ?  next_move = combination[0] :  next_move = combination[2]
        end
      elsif board.cells[combination[2]] == player_token
        if !board.taken?(combination[0], "array perspective") && !board.taken?(combination[1], "array perspective")
          rand >= 0.5 ?  next_move = combination[0] :  next_move = combination[1]
        end
      end
      return next_move + 1 if next_move < 10
    end
    nil
  end

  def ai_move(board)
    # If player can win, win!
    return attempt_win(board) if attempt_win(board)
    # If opponent can win, block them.
    return block_opponent(board) if block_opponent(board)
    # If a token is in a possible win combination, move your next token into
    # that same combination.
    return same_row_or_column(board) if same_row_or_column(board)
    # Make a move to a corner
    random_num = rand
    # move to the middle if available and if random_num is over the 20% threshold
    return middle_move(board) if !board.taken?(5) && random_num >= 0.2
    # move to a corner if available and if random_num is over the 20% threshold
    return corner_weighted(board) if avail_corners(board) != [] && random_num >= 0.2
    # Move any random place on the board.
    return random_move(board)
  end

  def avail_corners(board)
    [1, 3, 7, 9].select do |position|
      !board.taken?(position)
    end
  end

  def corner_weighted(board)
    avail_corners(board).sample
  end

  def middle_move(board)
    5
  end

  # return a blocking move (player perspective) if opponent has two in a row, otherwise return nil
  def block_opponent(board)
    # check for opponent's two_in_a_row?
    if two_in_a_row?(board, opponent_token)
      # move into the third spot to block
      return two_in_a_row?(board, opponent_token) + 1 # +1 to put into player perspective
    end
    nil
  end

  # return the winning move if possible (check for index vs player perspective), otherwise return nil
  def attempt_win(board)
    # check for self token 2 in a row?
    if two_in_a_row?(board, self.token) != nil
      return two_in_a_row?(board, self.token) + 1 # +1 to put into player perspective
    end
    nil
  end
end
