class Board

 attr_accessor :cells, :moves
 attr_reader :rank

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

  def initialize(cells = Array.new(9, " "))
    @cells = cells
    @moves = []
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token if valid_move?(input)
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n=============\n\n"
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.select {|c| c != " "}.size
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def taken?(input)
    @cells[input] != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !full? && !taken?(input.to_i - 1)
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def over?
    draw? || won?
  end

  def draw?
    full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      arr = combo.map {|c| @cells[c]}.sort
      !arr.include?(" ") && arr.first == arr.last
    end
  end

  def winner
   won? ? @cells[won?[0]] : nil
  end

  def rank
    @rank ||= final_state_rank || intermediate_state_rank
  end

  def final_state_rank
    if over?
      return 0 if draw?
      winner == 'X' ? 1 : -1
    end
  end

  def intermediate_state_rank
    ranks = @moves.collect {|board| board.rank}
    current_player == 'X' ? ranks.max : ranks.min
  end
end
