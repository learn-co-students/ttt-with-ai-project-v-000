class Board

  WIN_COMBINATIONS = [[0, 1, 2], 
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(position)
    cells[position.to_i - 1] != " "
  end

  def valid_move?(user_input)
    if !(1..9).include?(user_input.to_i)
      return false
    end

    !taken?(user_input)
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end

   def almost_won?

    WIN_COMBINATIONS.each do |almost|
      a_arr = [self.cells[almost[0]], self.cells[almost[1]], self.cells[almost[2]]]
      if a_arr.count("X") == 2 && a_arr.count(" ") == 1
        return almost
      elsif a_arr.count("O") == 2 && a_arr.count(" ") == 1
        return almost
      end
    end

    false
  end



end