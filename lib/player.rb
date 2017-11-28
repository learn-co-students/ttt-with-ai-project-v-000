class Player

    attr_reader :token
    
    def initialize(token)
        @token = token
        # @cells.tap! { |cell| cell }
    end
end