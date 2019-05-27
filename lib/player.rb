# Created by Naomi Dennis
# Full Stack Web Development v3
# Flatiron School
# 1/11/2018
class Player
    attr_reader :token

    def initialize(token)
      token.nil? ? @token = "X" : @token = token
    end

end
