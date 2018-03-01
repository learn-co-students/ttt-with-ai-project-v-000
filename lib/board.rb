class Board
  attr_accessor :cells

  ABOUT_TO_WIN_COMBINATIONS = [
    [0,1,2],
    [1,2,0],
    [0,2,1],
    [3,4,5],
    [4,5,3],
    [3,5,4],
    [6,7,8],
    [7,8,6],
    [6,8,7],
    [0,3,6],
    [3,6,0],
    [0,6,3],
    [1,4,7],
    [4,7,1],
    [1,7,4],
    [2,5,8],
    [5,8,2],
    [0,4,8],
    [4,8,0],
    [0,8,4],
    [4,6,2],
    [4,2,6],
    [6,2,4]
  ]

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "**********"
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    turns = 9
    @cells.each do |cell|
      if cell == " "
        turns -= 1
      end
    end
    turns
  end

  def taken?(position)
    @cells[position.to_i - 1] == " " ? false : true
  end

  def valid_move?(position)
    cell = position.to_i
    cell.between?(1,9) && !taken?(cell)
  end

  def update(input, player)
    position = input.to_i - 1
    @cells[position] = player.token
  end

  def available_moves
    moves = []
    @cells.each_with_index do |cell, index|
      if cell == " " 
        moves << (index + 1).to_s 
      end
    end
    moves
  end

  def random_move
    move = available_moves.sample
  end

  def about_to_win?
    ABOUT_TO_WIN_COMBINATIONS.detect do |combo|
      (@cells[combo[0]] == "O" && @cells[combo[1]] == "O" && @cells[combo[2]] != "X") || (@cells[combo[0]] == "X" && @cells[combo[1]] == "X" && @cells[combo[2]] != "O")
    end    
  end
end