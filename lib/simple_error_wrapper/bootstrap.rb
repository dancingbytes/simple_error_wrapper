# encoding: utf-8
module SimpleErrorWrapper

  module Bootstrap

    def call(tag, obj)

      %Q(<div class="has-error" data-container="body"
        data-toggle="popover" data-placement="auto"
        data-content="%{msg}">%{tag}</div>
      ).freeze % {
        tag: tag,
        msg: list(obj).html_safe
      }

    end # call

    def list(obj)

      html = obj.error_message.inject([]) { |arr, error|
        arr << error
      }
      html.join('\n')

    end # list

  end # Bootstrap

end # SimpleErrorWrapper

::SimpleErrorWrapper::ErrorMessage.send :extend, ::SimpleErrorWrapper::Bootstrap
