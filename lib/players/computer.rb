class Players

  class Computer < Player
    attr_accessor :my_moves, :opponent_moves, :empty_spaces, :opponent_token

  Computer::WINNING_COMBINATIONS = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [7,5,3]
    ]

  Computer::FORK_COMBINATIONS = [
    [1,3,5],
    [5,7,9],
    [1,5,7],
    [3,5,9],
    [1,3,9],
    [1,7,9],
    [3,7,9],
    [1,3,7]
    ]

  Computer::CORNER_PAIRS = [
    [1,9],
    [3,7]
  ]

  Computer::CORNERS = [1,3,7,9]

  Computer::CENTER = 5

  def initialize(token)
    super
    @my_moves = []
    @opponent_moves = []
    @empty_spaces = []
    if self.token == "X"
      @opponent_token = "O"
    else
      @opponent_token = "X"
    end
  end

  def read_board(board)
    board.cells.each_with_index do |cell, index|
      if cell == self.token
          if (my_moves.include?(index + 1) == false)
            my_moves << index + 1
            empty_spaces.keep_if {|empty_space| empty_space != index + 1}
          end
      elsif cell == self.opponent_token
        if(opponent_moves.include?(index + 1) == false)
          opponent_moves << index + 1
          empty_spaces.keep_if {|empty_space| empty_space != index + 1}
        end
      elsif (self.empty_spaces.include?(index + 1) == false)
        empty_spaces. << index + 1
      end
    end
  end


  def move(board)
    self.read_board(board)

    if(self.winning_move(my_moves) != nil && self.empty_spaces.include?(self.winning_move(my_moves)))

      self.winning_move(my_moves).to_s

    elsif(self.winning_move(opponent_moves) != nil && self.empty_spaces.include?(self.winning_move(opponent_moves)))
      self.winning_move(opponent_moves).to_s

    elsif(self.fork_move(my_moves) != nil && self.empty_spaces.include?(self.fork_move(my_moves)))

      self.fork_move(@my_moves).to_s

    elsif(self.fork_move(opponent_moves) != nil && self.empty_spaces.include?(self.winning_move(my_moves)))

      self.fork_move(opponent_moves).to_s

    elsif(!self.fork_move(opponent_moves) && self.empty_spaces.include?(CENTER))

      CENTER.to_s

    elsif(self.corner != nil)

      self.corner.to_s

    else

      self.empty_spaces.sample.to_s
    end
  end

  def winning_move(moves)
    check_combo = []
    almost_won = []
    winning_position = nil
    WINNING_COMBINATIONS.each do |combo|
      if ((moves & combo).length == 2)
        check_combo = combo
        almost_won = (moves & combo)
      end
    end
    if (almost_won.empty? == false)
      winning_position = (check_combo - almost_won).first
    end
    return winning_position
  end

  def fork_move(moves)
    check_combo = []
    almost_fork = []
    fork_position = nil
    FORK_COMBINATIONS.each do |combo|
      if ((moves & combo).length == 2)
        check_combo = combo
        almost_fork = (moves & combo)
      end
    end
    if (almost_fork.empty? == false)
      fork_position = (check_combo - almost_fork).first+1
    end
    return fork_position
  end

  def corner
    corner = nil
    if ((CORNERS & empty_spaces).empty? == false)
      corner = (CORNERS & empty_spaces).sample
    end
  end

  end
end
