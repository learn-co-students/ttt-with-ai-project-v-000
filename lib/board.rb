class Board
  attr_writer :cells

  def cells
    @cells =  []
  end

  def reset!
    @cells.clear
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(take)
    take = gets.chomp
    @cells["#{take.to_i - 1}"]
    display
  end

  def full?
    (@cells.all? { |turn| (turn == "X" || turn == "O") }) ? true : false
  end

  def turn_count
    counter = 0
    @cells.each { |turn| counter += 1 if turn == "X" || turn == "O" }
    counter
  end

  def taken?(index)
    (@cells[index.to_i - 1] != " " || nil) ? true : false
  end

  def valid_move?(index)
    (index.to_i.between?(1, 9) && (@cells[index.to_i - 1] == " " || @cells[index.to_i - 1] == nil)) ? true : false
  end

  def update(player, token = "X")
    if player.to_i % 2 == 0 || turn_count.even? == true # it's all even
      player
    else
      "O"
    end
  end
