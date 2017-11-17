require 'pry'

class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @cells = [" "," "," ", " "," "," "," "," "," "]
  end

  def reset!
    self.cells = [" "," "," ", " "," "," "," "," "," "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts " ----------- "
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts " ----------- "
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all?{ |cell| cell != " " }
  end

  def turn_count
    turns = 0
    self.cells.each do |cell|
      if cell != " "
        turns += 1
      end
    end
    turns
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end

  def valid_move?(input)
    valid = input.to_i > 0 && input.to_i < 10
    valid && !taken?(input) ? true : false
  end

  def update(input, player)
    if valid_move?(input) && !full?
      self.cells[input.to_i - 1] = player.token # player must have an attr "token"
    end
  end

  def suggest_win(token)
    m = ""
    opponent = token == "X" ? "O" : "X"

    #start by trying to win with next choice
    WIN_COMBINATIONS.each do |c|
      if self.cells[c[0]] == self.cells[c[1]] && valid_move?(c[2].to_s) &&
        (self.cells[c[0]] == token || self.cells[c[0]] == opponent)
        puts "one"
        m = c[2].to_s
      elsif self.cells[c[1]] == self.cells[c[2]] && valid_move?(c[0].to_s) &&
        (self.cells[c[0]] == token || self.cells[c[0]] == opponent)
        m = c[0].to_s
        puts "two"
      elsif self.cells[c[0]] == self.cells[c[2]] && valid_move?(c[1].to_s) &&
        (self.cells[c[0]] == token || self.cells[c[0]] == opponent)
        m = c[1].to_s
        puts "three"
      end
    end

    #if can't win or block, try to get middle spot; obv the best spot
    if m == ""
      valid_move?("5") ? m = "5" : m = ""
    end

    #back up: pick next empty cell
    if m == ""
      m = self.cells.index{|cell| cell == " "}
      m = m + 1
      m = m.to_s
    end

    m #return the computer's move
  end

end
