class Player::Computer < Player
  attr_accessor :token, :combos

  def initialize(token)
    @token = token
    @combos = Game::WIN_COMBINATIONS
    @opponents_token = "O" if @token == "X"
    @opponents_token = "X" if @token == "O"
  end

  def move(board)

    move_index =
    case
    when take_middle(board)
      take_middle(board)
    when win(board)
      win(board)
    when block(board)
      block(board)
    when corner(board)
      corner(board)
    else
      random(board)
    end

    "#{move_index+1}"

  end

  def take_middle(board)
    4 if board.turn_count < 4 && !board.taken?(5)
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
    corner_position =
    case
    when !board.taken?(1)
      0
    when !board.taken?(3)
      2
    when !board.taken?(7)
      6
    when !board.taken?(9)
      8
    end

  end

  def random(board)
    [*(0..8)].sample
  end


end
