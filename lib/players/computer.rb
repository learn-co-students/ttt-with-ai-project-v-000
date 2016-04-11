require 'pry'
class Computer < Player

  # attr_reader :player_turn_count

  # def initialize(token)
  #   # super # inherit the token instance variable and attr_accessor form Player class
  #   @token = token
  #   @player_turn_count = 0
  # end

  # def player_turn_count=(count)
  #   @player_turn_count = count
  # end
  #
  # def increment_turn_count
  #   self.player_turn_count += 1
  # end

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
      if board.turn_count < 3
        # if this is the player's first move, make a random move
        # can try to to a weighted random move with higher probability of moving
        # to the center or a corner first.
        return random_move(board)  # why did this not work without the return word?
      elsif board.turn_count < 9
        puts "now it's in the < 9 part *********"
        next_move = ai_move(board)
        return next_move
      else
      end
    end
  end # end #move

  # generates a random number as a string, "x", such that 1 < x <= 9
  def random_move(board)
    desired_move = (rand(9) + 1).to_s
    puts "random_move just returned a move to #{desired_move}"
    return desired_move if board.valid_move?(desired_move) # Need to look into what happens if it's not a valid move?... probably returns nil to game#turn
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
    # if player_token is in a WIN_COMBINATIONS space, look for player_token in the other two spaces.
    WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS

      if board.cells[combination[0]] == player_token
        if !board.taken?(combination[1], "array perspective") && !board.taken?(combination[2], "array perspective")
          rand >= 0.5 ?  nil :  nil
        end
      elsif board.cells[combination[1]] == player_token

      elsif board.cells[combination[2]] == player_token


      end
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
    #return same_row_or_column(board) if same_row_or_column(board)
    # Move any random place on the board.
    return random_move(board)
  end

  # return a blocking move (player perspective) if opponent has two in a row, otherwise return nil
  def block_opponent(board)  # this will be similar logic to where to move for a win on self.token
    # check for opponent's two_in_a_row?
    if two_in_a_row?(board, opponent_token)
      # move into the third spot to block
      # binding.pry
      return two_in_a_row?(board, opponent_token) + 1
    end
    nil
  end

  # return the winning move if possible (check for index vs player perspective), otherwise return nil
  def attempt_win(board)
    # check for self token 2 in a row?
    if two_in_a_row?(board, self.token) != nil
      # binding.pry
      return two_in_a_row?(board, self.token) + 1# ***** might need (+ 1) *****# move into the spot
    end
    nil
  end

end


# pseudo algorithm for better AI

# Every move should start by looking for 2 in a row of your opponent and blocking.
#
# move 1: go anywhere
# move 2: try to go in either the same column or same row as your first move (randomly)
#         if you can't do either of those, you can't win that strategy, so go another
#         random place on the board (perhaps the same row or column as your opponent).
# move 3: look for two in a row of your own kind and try to go in the third spot.
# move 4:


#### working random number AI ####
# while true
#   desired_move = (rand(9) + 1).to_s
#   return desired_move if board.valid_move?(desired_move)
# end
#### end working random number AI ####
