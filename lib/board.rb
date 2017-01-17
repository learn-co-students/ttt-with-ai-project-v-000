class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.display
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.include?(" ") == false
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(user_input)
    self.position(user_input) != " "
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && self.taken?(user_input) == false
  end

  def update(user_input, player = "X")
    index = user_input.to_i - 1
    if valid_move?(user_input)
      @cells[index] = player.token
    end
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def win_possible?
    Game::WIN_COMBINATIONS.find do |combo|
      ((@cells[combo[0]] == @cells[combo[1]]) && (@cells[combo[0]] != " ") && (@cells[combo[2]] == " ")) || ((@cells[combo[0]] == @cells[combo[2]]) && (@cells[combo[0]] != " ") && (@cells[combo[1]] == " ")) || ((@cells[combo[1]] == @cells[combo[2]]) && (@cells[combo[1]] != " ") && (@cells[combo[0]] == " "))
    end
  end

end
