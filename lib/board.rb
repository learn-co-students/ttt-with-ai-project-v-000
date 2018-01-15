class Board

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


  def position(input)
    @cells[input.to_i - 1]
  end


  def full?
    @cells.all?{|cell| cell != " "}
  end


  def turn_count
    @cells.count{|cell| cell == "X" || cell == "O"}
  end


  def taken?(input)
    position(input) != " " ? true : false
  end


  def valid_move?(input)
    input.to_i.between?(1, 9) && taken?(input) == false ? true : false
  end


  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end


  def check_block_combos

    @block_combos = {

      :block_rt => [[0, 1], [3, 4], [6, 7]],
      :block_lft => [[1, 2], [4, 5], [7, 8]],
      :block_blw => [[0, 3], [1, 4], [2, 5]],
      :block_abv => [[3, 6], [4, 7], [5, 8]],
      :hor_block_cntr => [[0, 2], [3, 5], [6, 8]],
      :ver_block_cntr => [[0, 6], [1, 7], [2, 8]],
      :diag_block_cntr => [[0, 8], [2, 6]]

    }

    @block_combos.each do |key, value|
      value.find do |combo|
        if @cells[combo[0]] == "X" && @cells[combo[1]] == "X" || @cells[combo[0]] == "O" && @cells[combo[1]] == "O"
          if key == :block_rt
            @play_move = (combo[1] + 1) + 1
          elsif key == :block_lft
            @play_move = (combo[0] + 1) - 1
          elsif key == :block_blw
            @play_move = (combo[1] + 1) + 3
          elsif key == :block_abv
            @play_move = (combo[0] + 1) - 3
          elsif key == :hor_block_cntr
            @play_move = (combo[0] + 1) + 1
          elsif key == :ver_block_cntr
            @play_move = (combo[1] + 1) - 3
          elsif key == :diag_block_cntr
            @play_move = 5
          end
        end
      end
    end
    @play_move
  end


  def check_diag_combos

    @diag_block_combos = {

      :block_up_rt => [4, 6],
      :block_up_lft => [4, 8],
      :block_low_rt => [0, 4],
      :block_low_lft => [2, 4]

    }

    @diag_block_combos.each do |key, value| # ex. value == [4, 6]
      if @cells[value[0]] == "X" && @cells[value[1]] == "X" || @cells[value[0]] == "O" && @cells[value[1]] == "O"
        if key == :block_up_rt
          @play_move = 3
        elsif key == :block_up_lft
          @play_move = 1
        elsif key == :block_low_rt
          @play_move = 9
        elsif key == :block_low_lft
          @play_move = 7
        end
      end
    end
    @play_move
  end
end

#seems to glitch on turn 6
# -- the combos need to account for empty spaces! ex. :block_up_rt => [4, 6, 3] >> ... && @cells[value[2]] == " " ???

#ex.
# Your turn, O.
#  O |   | X
# -----------
#  X | X | O
# -----------
#  O |   |

#then indefinite loop after I placed a token in space 8
