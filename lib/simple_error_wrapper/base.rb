module SimpleErrorWrapper

  class Base

    def initialize(object)

      me = self

      object.define_singleton_method(:error_decorator, ->(tag, obj) {
        me.call(tag, obj)
      }) unless object.respond_to?(:error_decorator)

    end # initialize

    def call(tag, obj)
      raise NotImplementedError
    end # call

  end # Base

end # SimpleErrorWrapper
