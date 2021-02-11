module Players #overwriting module that wraps the Computer class
  class Computer < Player # Computer class inherits all functionality from Player class

    def move(input)

    end
  end
end

###
#standard def:each of a set of standardized parts or independent units that
# can be used to construct a more complex structure, such as an item of furniture or a building.
#*****
#With modules you can share methods between classes
# Modules can be included into classes,
#and this makes their methods available on the class, just as if we’d copied and
#pasted these methods over to the class definition.
#This is useful if we have methods that we want to reuse in certain classes,
#but also want to keep them in a central place,
#so we do not have to repeat them everywhere
