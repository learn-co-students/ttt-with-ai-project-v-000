class Player::Computer < Player
  attr_reader :board, :cells

  def initialize(board)
    @board = board
    @cells = Array.new(9, " ")
  end

  def move(board)
    valid_moves = possible_position
  end

  def win_or_block(sym)
    finished = false
    0.upto(8) do |i|
      origin = @cells[i]
      @cells[i] = sym if origin.nil?
      finished = i + 1 if game.turn(sym)
      @cells[i] = origin
    end
    finished
  end

  def check_defaults
    if @cells[4]
      rand < 0.51 ? possible_position(&:even?) : possible_position(&:odd?)
    else
      5
    end
  end

  def possible_position(&block)
    result = (0..8).select(&block).each do |i|
      return i + 1 if @cells[i].nil?
    end
    result.is_a?(Integer) ? result : @cells.rindex(nil)
  end

  def other_symbol
    symbol == 'X' ? 'O' : 'X'
  end

  def loading_simulation
    str = "Computer is scheming"
    10.times do
      print str += '.'
      sleep(0.1)
    end
  end
end
