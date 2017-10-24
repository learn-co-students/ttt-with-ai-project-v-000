# require_relative "../../config/environment.rb"

module Players

  class Human < Player

      def move(array = [])
        print "Enter valid position: "
        gets.strip
      end

  end

  class Computer < Player

    # Array of all open board positions
    def all_options(board)
      options = []
      # position = nil
      board.cells.each_with_index do |cell, index|
        options << index if cell.strip.empty?
      end
      options
    end

    # Array of positions held by computer
    def owned_spots(board)
      owned_spots = []
      board.cells.each_with_index do |cell, index|
        owned_spots << index if cell == token
      end
      owned_spots
    end

    # Array of positions held by opponent
    def opponent(board)
      opponent = []
      board.cells.each_with_index do |cell, index|
        opponent << index if !cell.strip.empty? && cell != token
      end
      opponent
    end

    # Array of winning combinations which are at least one-thrid filfilled by computer
    def opportunities(board)
      opportunities = []
      owned_spots(board).each do |space|
        Game::WIN_COMBINATIONS.each do |combo|
          null = combo.any? do |position|
            opponent(board).any?{|space| space == position}
          end
          opportunities << combo if combo.include?(space) && !null
        end
      end
      opportunities
    end


    # Array of winning combinations which are two-thirds fulfilled by computer
    def super_opportunities(board)
      super_opportunities = []
      opportunities(board).each do |opportunity|
        super_opportunities << opportunity if (opportunity & owned_spots(board)).count == 2
      end
      super_opportunities
    end

    # Array of winning combinations which are at least one-thrid filfilled by opponent
    def threats(board)
      threats = []
      opponent(board).each do |space|
        Game::WIN_COMBINATIONS.each do |combo|
          null = combo.any? do |position|
            owned_spots(board).any?{|space| space == position}
          end
          threats << combo if combo.include?(space) && !null
        end
      end
      threats
    end

    # Array of winning combinations which are two-thirds fulfilled by opponent
    def super_threats(board)
      super_threats = []
      threats(board).each do |threat|
        super_threats << threat if (threat & opponent(board)).count == 2
      end
      super_threats
    end

    def ai_options(board)
      all_options = all_options(board)
      owned_spots = owned_spots(board)
      opponent = opponent(board)
      opportunities = opportunities(board)
      super_opportunities = super_opportunities(board)
      threats = threats(board)
      super_threats = super_threats(board)
      ai_options = []
      corners = [0,2,6,8]
      corners_available = []
      corners.each do |corner|
        corners_available << corner if all_options.include?(corner)
      end
      if board.cells.all?{|cell| cell.strip.empty?}
        ai_options = corners_available
      elsif !super_opportunities.empty?
        ai_options = super_opportunities.flatten & all_options
      elsif !super_threats.empty?
        if !(opportunities.flatten & super_threats.flatten & all_options).empty?
          ai_options = opportunities.flatten & super_threats.flatten & all_options
        else
          ai_options = super_threats.flatten & all_options
        end
      elsif !(opportunities.flatten & threats.flatten & all_options).empty?
        ai_options = opportunities.flatten & threats.flatten & all_options
      elsif !(threats.flatten & all_options).empty?
        ai_options = threats.flatten & all_options
      else
        ai_options = all_options
      end
      # Prioritizes corner spaces
      if !(corners_available & ai_options).empty?
        ai_options = corners_available & ai_options
      else
        ai_options
      end
    end

    def move(board)
      # puts ai_options(board)
      (ai_options(board).sample+1).to_s
    end

  end

end
