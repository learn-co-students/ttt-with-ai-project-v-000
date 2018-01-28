class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end
end


class Players
  class Human < Player

    def move(input)
      input = gets.strip
      return "#{input}"
    end

  end

end
