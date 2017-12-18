require 'colorize'
class Board
  attr_accessor :cells

  def initialize
    @cells = (1..9).map(&:to_s)
  end

  def reset!
    @cells = (1..9).map(&:to_s)
  end

  def display
    puts " #{colorize_cell(@cells[0])} | #{colorize_cell(@cells[1])} | #{colorize_cell(@cells[2])} "
    puts "-----------"
    puts " #{colorize_cell(@cells[3])} | #{colorize_cell(@cells[4])} | #{colorize_cell(@cells[5])} "
    puts "-----------"                                                                            
    puts " #{colorize_cell(@cells[6])} | #{colorize_cell(@cells[7])} | #{colorize_cell(@cells[8])} "
  end

  def colorize_cell(cell)
    case cell
    when "X"
      cell.light_cyan
    when "O"
      cell.red
    else
      cell.green
    end
  end

  def user_input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    board_position = user_input_to_index(user_input)
    @cells[board_position]
  end

  def full?
    @cells.all? {|board_position| %w[X O].include?(board_position)}
  end

  def turn_count
    counter = 0
    @cells.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    index = user_input_to_index(user_input)
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(user_input)
    index = user_input_to_index(user_input)
    !taken?(user_input) && index.between?(0,8)
  end

  def update(user_input, player)
    index = user_input_to_index(user_input)
    @cells[index] = player.token
  end
end
