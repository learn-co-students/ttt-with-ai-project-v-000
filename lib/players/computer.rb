require 'pry'

module Players
  class Computer < Player
    def move(board)
      move = nil

      # Occupy center first, if available.
      if !board.taken?(5)
        move = "5"

      # Going second and middle is taken, take a corner
      elsif board.turn_count == 1
        move = "1"

      # Went first and took middle, take an unoccupied corner
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect { |cell| !board.taken?(cell) }.to_s

      # Went second and took middle, take an edge
      elsif board.turn_count == 3
        move = [1, 3, 7, 9].detect { |cell| !board.taken?(cell) }.to_s

      else

        # evaluate possibilities to win by iterating through the combinations to see if any two cells are of the same token and the last
        # remaining cell is empty.

        Game::WIN_COMBINATIONS.detect do |combination|
        if combination.select { |cell| board.position(cell + 1) == token}.size == 2 &&
        combination.any? { |cell| board.position(cell + 1) == " "}
          move = combination.select { |cell| !board.taken?(cell + 1)}.first.to_i.+(1).to_s


        # if no possibilities of a win, block the opponent for a draw
        elsif combination.select { |cell| board.position(cell + 1) != " " && board.position(cell + 1) != token}.size == 2 &&
        combination.any? { |cell| board.position(cell + 1) == " "}
          move = combination.select { |cell| !board.taken?(cell + 1)}.first.to_i.+(1).to_s
        end
      end
      # if no WIN_COMBINATIONS patterns exist, iterate through the cells and select a position, starting with corners, then edges.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect { |cell| !board.taken?(cell)}.to_s if move == nil
      end
      move
    end
  end
end
