class Player::Computer < Player
  attr_accessor :choice, :player, :opponent
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
    self.minimax(board.cells)
    @choice
  end

  def score(board)
    current_player = board.count{|token| token == "X" || token == "O"}
    if board.win?(current_player)<---- #have to test for a winner
      10
    elsif game.win?(!current_player)
     -10
    end
  end

  def minimax(board)
    return score(board) if board == self.token
    scores = [] # an array of scores
    moves = []  # an array of moves
binding.pry
  # Populate the scores array, recursing as needed
      board.size.times.select {|i| board[i] == ' '}.each do |move|
      test_game = board[move.to_i - 1] = self.token #<---update board with token at the empty space
      scores.push(minimax(test_game)) #<----into the scores array push itself
      moves.push(move) #<---into the moves array push a |move| or each empty space
    end

    #if it's self turn
    turn_count = board.count{|token| token == "X" || token == "O"}
    current_player = turn_count % 2 == 0 ? "X" : "O"
    # Do the min or the max calculation
    if current_player == self.token ######<---- get this right
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0] + 1) == board.position(combo[1] + 1) &&
        board.position(combo[1] + 1) == board.position(combo[2] + 1) &&
        board.taken?(combo[0] + 1) ### this +1 stuff seems wrong but
      end                          ### I tried the below and it didn't work...
    end
  end
end

############# this is a nightmare ##############



# class Player::Computer < Player
#   def move(board)
#     m = board.cells.size.times.select {|i| board.cells[i] == ' '}
#     m.select - 1
#   end
# end
#   attr_accessor :op_token
#   @op_token = ""
#   def move(board, t = self.token)
#
#
#   token == "O" ? @op_token = "X" : @op_token = "O"
#   def two_in_a_row(board, t = token)
#     m = false
#     m = 3 if board[0] == t && board[1] == t && board[2] == " "
#     m = 6 if board[3] == t && board[4] == t && board[5] == " "
#     m = 9 if board[6] == t && board[7] == t && board[8] == " "
#     m = 1 if board[1] == t && board[2] == t && board[0] == " "
#     m = 4 if board[4] == t && board[5] == t && board[3] == " "
#     m = 7 if board[7] == t && board[8] == t && board[6] == " "
#     m = 7 if board[0] == t && board[3] == t && board[6] == " "
#     m = 8 if board[1] == t && board[4] == t && board[7] == " "
#     m = 9 if board[2] == t && board[5] == t && board[8] == " "
#     m = 1 if board[6] == t && board[3] == t && board[0] == " "
#     m = 2 if board[4] == t && board[7] == t && board[1] == " "
#     m = 3 if board[8] == t && board[5] == t && board[2] == " "
#     m = 3 if board[6] == t && board[4] == t && board[2] == " "
#     m = 7 if board[4] == t && board[2] == t && board[6] == " "
#     m = 1 if board[0] == t && board[4] == t && board[8] == " "
#     m = 9 if board[4] == t && board[0] == t && board[8] == " "
#     m
#   end
#        ################ why am i doing this?!!! ##################
#
#     #If you have two in a row, you can place a third to get three in a row.
#     if two_in_a_row(board, token)
#       two_in_a_row(board, token)
#
#     #If the opponent has two in a row, you must play the third to block the opponent.
#     elsif two_in_a_row(board, @op_token)
#       two_in_a_row(board, @op_token)
#
#
#     #Fork: Create an opportunity where you have two threats to win (two non-blocked lines of 2).
#   #  elsif
#
#     # Blocking an opponent's fork: If there is a configuration where the opponent can fork, you must block that fork.
#   #  elsif
#
#
#     # Center: You play the center if open.
#     elsif board[5] == " "
#       m = 6
#
#     # Opposite corner: If the opponent is in the corner, you play the opposite corner.
#     elsif board[0] == @op_token
#       m = 9
#     elsif board[6] == @op_token
#       m = 3
#     elsif board[8] == @op_token
#       m = 6
#     elsif board[2] == @op_token
#       m = 7
#
#     # Empty corner: You play in a corner square.
#     elsif !board.taken(1)
#       m = 1
#     elsif !board.taken(3)
#       m = 3
#     elsif !board.taken(7)
#       m = 7
#     elsif !board.taken(9)
#       m = 9
#
#     # Empty side: You play in a middle square on any of the 4 sides.
#     elsif !board.taken(2)
#       m = 2
#     elsif !board.taken(8)
#       m = 8
#     elsif !board.taken(4)
#       m = 4
#     elsif !board.taken(6)
#       m = 6
#     else
#       m = board.rand
#     end
#
#   end
# end


    ####### now lets try 20 different versions of MINIMAX ####
   ####### one week later nothing I need a teacher ####
