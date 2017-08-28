module Players

  class Computer < Player
    attr_accessor :skill, :choice, :seed
#Baby, intermediate, Invictus-9000

    def initialize(skill=1)
      super
#      puts "My skill value is #{skill}"
#      puts "The monkey is grabbing some darts" if @skill == 1
#      if @skill == 2
#        puts "Powering up the skillful opponent"
  #      @seed = rand(1..100)
#      end
  #    puts "Up Up Down Down Left Right Left Right B A\n GOD MODE ENABLED" if @skill == 3
    end

    def move(board)
      if @skill == 1
        random_move.to_s
      elsif @skill == 2
        stormherald_proc(board) #a skillful move
  #    elsif @skill == 3
  #      commence_primary_ignition(board) #a masterful move using minmax
      else
        random_move.to_s
      end

    end

    def random_move
      rand(1..9)
    end

    def stormherald_proc(board) #a skillful move
      our_spaces = (self.game.board.cells.map.with_index {|space, index| index if space == self.token}).reject {|i| i == nil} #returns an array of all index positions with player token
      enemy_spaces = (self.game.board.cells.map.with_index {|space, index| index if (space != self.token && space != " ")}).reject {|i| i == nil}
      corners = [0,2,6,8]
      if (Game::WIN_COMBINATIONS.map {|i| i-our_spaces}).any? {|i| i.size == 1} && self.game.board.cells[((Game::WIN_COMBINATIONS.map {|i| i-our_spaces}).detect {|i| i.size == 1})[0]] == " "
          ((Game::WIN_COMBINATIONS.map {|i| i-our_spaces}).detect {|i| i.size == 1})[0]+1 #makin moves
      elsif (Game::WIN_COMBINATIONS.map {|i| i-enemy_spaces}).any? {|i| i.size == 1} && ((Game::WIN_COMBINATIONS.map {|i| i-enemy_spaces}).select {|i| i.size == 1}).any? {|i| self.game.board.cells[i[0]] == " "}
        ((Game::WIN_COMBINATIONS.map {|i| i-enemy_spaces}).select {|i| i.size == 1}).select {|i| self.game.board.cells[i[0]] == " "}[0][0]+1#block the opposition; can still lose if they have multiple wins
      elsif @seed <= 75
        if self.game.board.taken?(5) != true
          5
        elsif (corners.select {|i| i if self.game.board.cells[i] == " "}).size > 0
          (corners.select {|i| i if self.game.board.cells[i] == " "}).sample+1
        else
          random_move
        end
      elsif @seed > 75
        if self.game.board.turn_count == 0
          (corners.select {|i| i if self.game.board.cells[i] == " "}).sample+1
          go_ruthless = true
        elsif go_ruthless == true && self.game.board.turn_count == 1
          if our_spaces[0] == 0
            self.game.board.valid_move?(8) ? 9 : [2,6].sample
          elsif our_spaces[0] == 2
            self.game.board.valid_move?(6) ? 7 : [0,8].sample
          elsif our_spaces[0] == 6
            self.game.board.valid_move?(2) ? 3 : [0,8].sample
          elsif our_spaces[0] == 8
            self.game.board.valid_move?(0) ? 1 : [2,6].sample
          end
        else
          @seed = 0
          go_ruthless = false
          (corners.select {|i| i if self.game.board.cells[i] == " "}).size > 0 ? (corners.select {|i| i if self.game.board.cells[i] == " "}).sample+1 : stormherald_proc(board)
        end
      end
    end

  #  def commence_primary_ignition(board) #a masterful move using minmax
  #    current_board = board.cells
  #    minmax(current_board, self.token)
  #    @choice+1
  #  end

  #  def score(board, depth) #used for minimax
  #    if minmax_winner(board) == self.token
  #      10 - depth
  #    elsif minmax_winner(board) != (self.token || " ") && !!minmax_winner(board) != false
  #      depth - 10
  #    else
  #      0
  #    end
  #  end

  #  def minmax(board, current_player, depth=0)
  #      return score(board) if minmax_over?(board)
  #      depth += 1
  #      scores = {}
  #      ((self.game.board.cells.map.with_index {|s, index| index if s == " "}).reject {|i| i == nil }).each do |move|
  #        # Copy board so we don't mess up original
  #        potential_board = board.dup
  #        potential_board[move] = current_player
  #        scores[move] = minmax(potential_board, switcher(current_player))
  #      end

  #      @choice = best_move(current_player, scores)
  #  end

  #  def switcher(piece)
  #    game.player_1.token == piece ? game.player_2.token : game.player_1.token
  #  end

  #  def best_move(piece, scores)
  #    if piece == self.token
  #      scores.max_by {|_k,v| v }
  #    else
  #      scores.min_by {|_k,v| v }
  #    end
  #  end

  #  def minmax_draw?(board)
  #    minmax_full?(board) && (!!minmax_won?(board) == false)
  #  end

  #  def minmax_won?(board)
  #    Game::WIN_COMBINATIONS.detect do |c|
  #      c.all? {|i| board[i] == self.game.player_1.token} || c.all? {|i| board[i] == self.game.player_2.token}
  #    end
  #  end

  #  def minmax_over?(board)
  #    !!minmax_won?(board) || minmax_draw?(board)
  #  end

  #  def minmax_winner(board)
  #    board[minmax_won?(board)[0]] unless minmax_won?(board) == nil
  #  end

  #  def minmax_full?(board)
  #    board.all? {|i| i == self.game.player_1.token || i == self.game.player_2.token }
  #  end

  end
end
