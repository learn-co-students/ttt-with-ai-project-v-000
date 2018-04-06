class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    current_player = nil
    if board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    board.full? || won? || draw?
  end

  def won?
    if !over?
      WIN_COMBINATIONS.each do |win_combination|
        won = []
          win_combination.each do |position|
            won << board.cells[position]
          end
        if won.all? {|tokens|tokens == "X" } || won.all? {|tokens| tokens == "O"}
          return win_combination
        else
          false
      end
    end
  end
  end




end
