class Board

  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  attr_accessor :cells, :choice

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(player_input)
    cells[player_input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.select {|cell| cell == " "}.size
  end

  def taken?(player_input)
    cells[player_input.to_i - 1] != " "
  end

  def valid_move?(player_input)
    player_input.to_i >= 1 && player_input.to_i <= 9 && !taken?(player_input)
  end
# don't get why this didn't work.
  # def update(player_input, player)
  #   binding.pry
  #   self.position(player_input) == player.token
  # end

  def update(input, player)
  	cells[input.to_i - 1] = player.token
  end

  def get_new_state(move)
      #make new instance of game, with board as it currently is
    theoretical_board = Board.new
    theoretical_board.cells = cells
    theoretical_board.cells[move] = theoretical_board.current_player
    theoretical_board
  end

    def min_max(current_game, current_player)
      return score(current_game, current_player) if current_game.over?
      scores = []
      moves = []

      possible_moves.each do |move|
        possible_game = get_new_state(move)
        if min_max(possible_game, opp_player) == nil
          next
        end
        scores << min_max(possible_game, opp_player)
        moves << move
      end

        if current_player == current_player
          max_score = scores.each_with_index.max[1]
          binding.pry
          self.choice = moves[max_score]
          return scores[max_score]
        else
          min_score = scores.each_with_index.min[1]
          self.choice = moves[min_score]
          return scores[min_score]
        end
      end

    def score(game, current_player)
      if winner == nil
        return 0
      elsif winner == current_player
        return 10
      else
        return -10
      end
    end

    def possible_moves
      possible = []
      cells.each_with_index do |cell, indx|
         if valid_move?((indx + 1).to_s)
          possible << indx
         end
      end
      possible
    end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def opp_player
    turn_count.odd? ? "X" : "O"
  end

  # def over?
  #   if board.full?
  # end
  def won?

    WIN_COMBINATIONS.each do |win_combination|
      #cycles through WIN_COMBINATIONS i.e. [0,1,2], then [3,4,5], then [6,7,8]
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      #then gets values at each of these cells
      position_1 = cells[win_index_1] #could be "X", "O", or " "
      position_2 = cells[win_index_2] #could be "X", "O", or " "
      position_3 = cells[win_index_3] #could be "X", "O", or " "

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
    false
  end

# more elegant solution
  # def won?
  #   winning_array = Game::WIN_COMBINATIONS::WIN_COMBINATIONS
  #   winning_array.detect do |combo|
  #     board.cells[combo[0]] == board.cells[combo[1]] &&
  #     board.cells[combo[1]] == board.cells[combo[2]] &&
  #     board.taken?(combo[0] + 1)
  #   end
  # end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? cells[won?.first] : nil
  end



end
