class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    #horizontal
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertical
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal
    [0,4,8],
    [2,4,6]
  ]

  def board
    @board
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @turn_count = @board.turn_count
  end

  def current_player
    if @turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    won? || @board.full? && !won?
  end

  def won?
    x_pos = []
    y_pos = []
    result = false
    flag = true
    @board.cells.each_index do |position|
      if @board.cells[position] == "X"
        x_pos << position
      end
      if @board.cells[position] == "O"
        y_pos << position
      end
    end # each_index
    WIN_COMBINATIONS.each do |combo|
      if (x_pos & combo).length == 3 || (y_pos & combo).length == 3
        if flag == true
         result = combo
         flag = false
        end
      end
    end # WIN_COMBOS
    result
  end # method

  def draw?
    over? && !won?
  end

  def winner
    if won?
      if @board.cells.count("X" || "O") % 2 == 0
        "O"
      else
        "X"
      end
    end
  end

  def turn
    if @turn_count % 2 == 0
     player = player_1
    else
     player = player_2
    end
    index = player.move(@board)
    if !@board.valid_move?(index)
      turn
    else
      @turn_count +=1
      index
    end
  end

  def play
    until over?
      position = turn
      if current_player == player_1
        player = player_2
      elsif  current_player == player_2
        player = player_1
      end
      @board.update(position, player)
    end
  end

end # end class
