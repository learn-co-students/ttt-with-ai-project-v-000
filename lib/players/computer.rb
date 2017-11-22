class Players
  class Computer < Player

    attr_accessor :current_combo, :board

    WIN_COMBINATIONS = [[0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8],
                        [0, 3, 6],
                        [1, 4, 7],
                        [2, 5, 8],
                        [0, 4, 8],
                        [2, 4, 6]].freeze

    def initialize(token, game)
      super(token)
      @board = game.board
      @current_combo = WIN_COMBINATIONS[rand(0..7)]
    end

    def combo_winnable?(combo)
      !combo.map { |index| (@board.cells[index] == ' ') || (@board.cells[index] == @token) }.include?(false)
    end

    def about_to_lose?
      board = @board.cells
      WIN_COMBINATIONS.each do |combo|
        contents = [board[combo[0]], board[combo[1]], board[combo[2]]]
        return combo if contents.count(' ') < 2 && !contents.include?(@token)
      end
      false
    end

    def get_move_to_block(combo)
      combo.each { |index| return index if @board.cells[index] == ' ' }
    end

    def new_combo
      @current_combo = []
      WIN_COMBINATIONS.each { |combo| return @current_combo = combo if combo_winnable?(combo) }
      @board.cells.each_with_index { |cell, k| @current_combo << k if cell == ' ' }
    end

    def move(arg)
      new_combo unless combo_winnable?(@current_combo)

      if (combo = about_to_lose?)
        return (get_move_to_block(combo) + 1).to_s
      end

      (@current_combo.sample + 1).to_s
    end
  end
end
