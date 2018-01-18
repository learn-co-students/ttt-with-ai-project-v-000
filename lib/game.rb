

class Game
  attr_accessor :board, :player_1, :player_2



  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8]
]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    counter = 0
    board.cells.each{|x| if x != " "; counter += 1 end}

    if counter % 2 == 0
      return player_1
    elsif counter % 2 == 1
      return player_2
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def won?
    WIN_COMBINATIONS.each do |check|
      win_index_1 = check[0]
      win_index_2 = check[1]
      win_index_3 = check[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true
      end
    end
    return false
  end

  def draw?
    if won? || board.cells.include?(" ")
      return false
    end
      return true
  end

  def winner
    if won?
      x_count = 0
      o_count = 0
      board.cells.each{|x| if x == "X"; x_count += 1; elsif x == "O"; o_count += 1 end}
      if x_count > o_count
        return "X"
      elsif o_count > x_count
        return "O"
      end
    end
    return nil
  end

  def turn
    puts "Please chose a spot"
    move = current_player.move
    if board.valid_move?(move)
      move
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end

    if winner != nil
      weiner = winner
      puts "Congratulations #{weiner}!"
    end

    if draw?
      puts "Cats Game!"
    end

  end




end
