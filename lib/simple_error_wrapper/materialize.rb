module SimpleErrorWrapper

  class Materialize < ::SimpleErrorWrapper::Base

    if defined?(::Materialize)

      if !(::Materialize::Sass::VERSION =~ /\A0./).nil?

        require 'simple_error_wrapper/materialize/version0'
        include ::SimpleErrorWrapper::MaterializeVersion0

      elsif !(::Materialize::Sass::VERSION =~ /\A1./).nil?

        require 'simple_error_wrapper/materialize/version1'
        include ::SimpleErrorWrapper::MaterializeVersion1

      end

    end

    private

    def list(obj)

      obj.error_message.inject([]) { |arr, error|
        arr << error
      }.join('\n')

    end # list

  end # Materialize

end # SimpleErrorWrapper
