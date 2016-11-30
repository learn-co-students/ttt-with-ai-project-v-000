class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],  #0
    [3,4,5],  #1
    [6,7,8],  #2
    [0,3,6],  #3
    [1,4,7],  #4
    [2,5,8],  #5
    [0,4,8],  #6
    [2,4,6]   #7
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count % 2 == 0
      @player_1
    elsif board.turn_count == 1
      @player_2
    elsif board.turn_count == 0
      @player_1
    elsif board.turn_count % 2 != 0
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      position1 = board.cells[win_index1]
      position2 = board.cells[win_index2]
      position3 = board.cells[win_index3]

      if ((position1 == "X") && (position2 == "X") &&
         (position3 == "X")) ||
         ((position1 == "O") && (position2 == "O") && (position3 == "O"))

        return win_combo
      end
    end
    false
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo == won?
        return board.cells[win_combo[0]]
      end
    end
    nil
  end

  def draw?
    if (won? == true)
      false
    elsif (board.full? == true) && (won? == false)
      true
    else
      false
    end
  end

  def over?
    if (won? == true) || (draw? == true) || (board.full? == true)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)

    if board.valid_move?(input) == true
      board.update(input, current_player)
    else
      puts "Your input was invalid."
      turn
    end
  end

  def play
    until over? || won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
