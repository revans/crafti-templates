require 'delegate'

# Decorators are for sprinkling methods on model objects for use within Service type objects
module Decorators
  # Decorator is an inheritable class object to DRY necessary methods
  class Decorate < SimpleDelegator

    # Model: pass the constructor the model object
    def initialize(model)
      super(model)
    end

    # delegates method calls off to the actual model object
    def to_model
      __getobj__
    end

    # delegates the class method call to the model object
    def class
      to_model.class
    end
  end
end