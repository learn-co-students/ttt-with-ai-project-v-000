class Player::Computer < Player
  attr_accessor :token, :combos

  def initialize(token)
    @token = token
    @combos = Game::WIN_COMBINATIONS
    if @token == "X"
      @opponents_token = "O"
    else
      @opponents_token = "X"
    end
  end

  def move(board)
    move_index = nil
    # take_middle(board) # either return 4 if its the first or second turn or return nil

    if take_middle(board)
      move_index = take_middle(board)
    elsif win(board)
      move_index = win(board)
    elsif block(board)
      move_index = block(board)
    elsif corner(board)
      move_index = corner(board)
    else
      move_index = random(board)
    end

    "#{move_index+1}"

  end

  def take_middle(board)
    middle_position = nil
    if board.turn_count < 4
      if !board.taken?(5)
        middle_position = 4
      end
    end
  end

  def win(board)
    win_position = nil
    combos.each do |combo|

      position_1 = board.cells[combo[0]]
      position_2 = board.cells[combo[1]]
      position_3 = board.cells[combo[2]]

      if position_1 == @token && position_2 == @token && position_3 == " "
        win_position = combo[2]
      elsif position_1 == @token  && position_3 == @token && position_2 == " "
        win_position = combo[1]
      elsif position_2 == @token && position_3 == @token && position_1 == " "
        win_position = combo[0]
      end
    end
    win_position
  end

  def block(board)
    block_position = nil

    combos.each do |combo|
      # combo = [0,1,2], [3,4,5]
      # if I find a position worth blocking, set it to block_position
      position_1 = board.cells[combo[0]]
      position_2 = board.cells[combo[1]]
      position_3 = board.cells[combo[2]]

      if position_1 == @opponents_token && position_2 == @opponents_token && position_3 == " "
        block_position = combo[2]
      elsif position_1 == @opponents_token  && position_3 == @opponents_token && position_2 == " "
        block_position = combo[1]
      elsif position_2 == @opponents_token && position_3 == @opponents_token && position_1 == " "
        block_position = combo[0]
      end
    end
    block_position
  end

  def corner(board)
    corner_position = nil
    if !board.taken?(1)
      corner_position = 0
    elsif !board.taken?(3)
      corner_position = 2
    elsif !board.taken?(7)
      corner_position = 6
    elsif !board.taken?(9)
      corner_position = 8
    end
    corner_position
  end

  def random(board)
    [*(0..8)].sample
  end


end # class end
