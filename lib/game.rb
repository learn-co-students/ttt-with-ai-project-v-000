class Game # Humans
  attr_accessor :board, :player_1, :player_2

  # defaults to two human players, X and O, with an empty board
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
  ]
  # a helper method for current_player method
  def turn_count
    counter = 0
    @board.cells.each do | occ_pos |
      if  occ_pos == "X" ||  occ_pos =="O"
        counter+=1
      end
    end
    counter
  end

  def current_player
    counter = 0
    @board.cells.each do | occ_pos |
      if  occ_pos == "X" ||  occ_pos =="O"
        counter+=1
      end
    end
    counter
    if counter % 2 == 0
      player_1 # these were defined in the init method with the values player_1 == X and player_2 == O
    else
      player_2
    end
  end

  def over?
    won? || draw?
  end

  def turn
    puts "Please enter 1-9:"
    if @board.valid_move?(player_1.move(@board)) # if player makes a valid move
      # make a move to the new position = player_1.move
      if current_player == player_1
        player_2.move(@board)
        binding.pry
      end
    else
      turn
    end
  end

# +++++++++++++++++++++++++++++++++++++++++ Helper Methods +++++++++++++++++++++++++++++++++++++++++++++++++++

  # helper method for over?
  def won?
    WIN_COMBINATIONS.detect do | win_comb |
      win_index_1 = win_comb[0]
      win_index_2 = win_comb[1]
      win_index_3 = win_comb[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 ==  position_2 && position_2 ==  position_3 && position_1 != " "
         win_comb # return the win_combination indexes that won.
      else
        false
      end
    end
  end

  # helper method for over?
  def draw?
    !won? && full?
  end

  # helper method for draw?
  def full?
    @board.cells.none? do | position |
      position == " "
    end
  end

  # The winner method should return the token, "X" or "O" that has won the game given a winning board.
  def winner
    win_combination = won?
    if win_combination
      win_index = win_combination[0]
      wining_token = @board.cells[win_index]
      wining_token
    end
  end

end
