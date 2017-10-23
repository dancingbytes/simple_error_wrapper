module SimpleErrorWrapper

  class Bootstrap < ::SimpleErrorWrapper::Base

    ERROR_TMPL = %(<div
      class="has-error" data-container="body"
      data-toggle="popover" data-placement="auto"
      data-content="%{msg}">%{tag}</div>
    ).freeze

    def call(tag, obj)

      ERROR_TMPL % {
        tag: tag,
        msg: list(obj).html_safe
      }

    end # call

    private

    def list(obj)

      obj.error_message.inject([]) { |arr, error|
        arr << error
      }.join('\n')

    end # list

  end # Bootstrap

end # SimpleErrorWrapper
