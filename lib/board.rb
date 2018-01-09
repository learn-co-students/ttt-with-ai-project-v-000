class Board
  attr_accessor :cells, :board

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize(board = nil)
    @cells = board || Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i-1
    @cells[index]
  end

  def full?
    !@cells.any? {|index| index == " "}
  end

  def turn_count
    @cells.count {|token| token != " "}
  end

  def taken?(position)
    if @cells[position.to_i-1] != " " && @cells[position.to_i-1] != ""
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i-1.between?(0,8) && !taken?(position)
      true
    else
      false
    end
  end

  #def update
    #player.token - player = double("player", :token => "X") <- sets mock player instance so that "player.token" can be "X" or "O"
    #significant to define player (needs attr_accessor of token)
    #test passes in arguemtns, one string of position, and one instance of player -> [board.update("1", player)]
  #end
end
