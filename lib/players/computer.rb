class Player::Computer < Player
  attr_accessor :my_moves, :opponent_moves, :empty_spaces, :opponent_token

  Computer::FORK_COMBINATIONS = [
    [0,2,4],
    [4,6,8],
    [0,4,6],
    [2,4,8],
    [0,2,8],
    [0,6,8],
    [2,6,8],
    [0,2,6]
    ]

  Computer::CORNER_PAIRS = [
    [0,8],
    [2,6]
  ]

  Computer::CORNERS = [0,2,6,8]

  Computer::CENTER = 4

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
          if (@my_moves.include?(index) == false)
            @my_moves << index
          end
      elsif cell == self.opponent_token
        if(@opponent_moves.include?(index) == false)
          @opponent_moves << index
        end
      else
        if(@empty_spaces.include?(index) == false)
          @empty_spaces << index
        end
      end
    end
  end

  def valid_move?(board, location)
    location.to_i.between?(1,9) && !taken?(board, location.to_i - 1)
  end



  def move(board)
    case self.read_board(board)

    when self.valid_move?(board, self.winning_move(@my_moves))
      self.winning_move(@my_moves)
    when self.valid_move?(board, self.winning_move(@opponent_moves))
      self.winning_move(@opponent_moves)
    when self.valid_move?(board, self.fork_move(@my_moves))
      self.fork_move(@my_moves)
    when self.valid_move?(board, self.fork_move(@opponent_moves))
      self.fork_move(@opponent_moves)
    when self.valid_move?(board, CENTER)
      CENTER
    when self.valid_move?(board, self.opposite_corner)
      self.opposite_corner
    when self.valid_move?(board, self.corner)
      self.corner
    else
      self.empty_space
    end
  end

  def winning_move(moves)
    check_combo = []
    almost_won = []
    winning_position = nil
    Game.WIN_COMBINATIONS.each do |combo|
      if ((moves & combo).length == 2)
        check_combo = combo
        almost_won = (moves & combo)
      end
    end
    if (almost_won.empty? == false)
      winning_position = check_combo - almost_won
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
      fork_position = check_combo - almost_fork
    end
    return fork_position
  end

  def opposite_corner
    opposite_corner = nil
    CORNER_PAIRS.each do |corner_pair|
      opponent_corner = @opponent_moves & corner_pair
      if (opponent_corner.empty? == false)
        opposite_corner = opponent_corner - corner_pair
      end
    end
    return opposite_corner
  end

  def corner
    return CORNERS.sample
  end

  def empty_space
    return @empty_spaces.sample
  end

end
