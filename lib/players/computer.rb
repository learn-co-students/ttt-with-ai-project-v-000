require 'pry'
class Players::Computer < Player
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def move(board)
    puts "Where will you place your token?"
    input = ""
    new_combo = []
    rejected = []

    if board.turn_count == 0
      input = "5"
    else
      WIN_COMBINATIONS.each do |combo|
        a = board.cells[(combo[0])]
        b = board.cells[(combo[1])]
        c = board.cells[(combo[2])]

        scombo = [combo[0] + 1, combo[1] + 1, combo[2] + 1]

        if !board.taken?(combo[0] + 1) || !board.taken?(combo[1] + 1) || !board.taken?(combo[2] + 1)
          scombo.each_with_index do |x, index|

            if !board.taken?(x)
              new_combo << scombo.at(index)
            else
              rejected << scombo.at(index)
            end
          end
        end
      end
      new_combo.uniq!
      input = (new_combo.sample.to_i).to_s
    end
   input
  end
end
