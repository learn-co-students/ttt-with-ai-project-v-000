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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    #expect(game.current_player.token).to eq("X")
    if !@board.full?
      @board.turn_count.even? ? @player_1 : @player_2
    end
  end
  def over?
    draw? || won?
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_1 = @board.cells[win_combo[0]]
      position_2 = @board.cells[win_combo[1]]
      position_3 = @board.cells[win_combo[2]]
      position_1 == position_2 && position_2 == position_3 && @board.taken?(win_combo[0]+1)
    #     return win_combo

    end

  end
  def draw?
    !won? && @board.full?
  end
  def winner
    won? ? @board.cells[won?[0]] : nil
  end
  def start

  end

  def play
    until over?
      self.turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def turn
    current_player = (@board.turn_count % 2 == 0 ? @player_1 : @player_2)
    input = ""
    until @board.valid_move?(input)
      puts "#{current_player.token}: Please enter 1-9:"
      input = current_player.move(@board)
    end
    @board.cells[input.to_i-1] = current_player.token
    @board.display
  end

end
