class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.none? {|value| value == " "}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    if user_input.to_i.between?(1, 9) && taken?(user_input) == false
      true
    end
  end

  def update(user_input, player)
    if valid_move?(user_input) == true && full? == false
      cells[user_input.to_i - 1] = "#{player.token}"
    end
  end

end

#rspec spec/01_board_spec.rb
