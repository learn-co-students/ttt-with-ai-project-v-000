class Board
  attr_accessor :cells, :token_1, :token_2

  def initialize
    reset!
    @token_1 = "X"
    @token_2 = "O"
  end

  def reset!
    @cells = Array.new(9, " ")
    #@cells =  [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def update(choice, player)
    @cells[choice.to_i-1] = player.token if valid_move?(choice)
  end

  def full?
    @cells.all? {|i| i == token_1 || i == token_2 }
  end

  def turn_count
    @cells.count {|i| i == token_1 || i == token_2}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !(self.taken?(input)) && input.to_i >= 1 && input.to_i <= 9
  end

end
