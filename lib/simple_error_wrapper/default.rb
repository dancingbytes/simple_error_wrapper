module SimpleErrorWrapper

  class Default < ::SimpleErrorWrapper::Base

    ERROR_TMPL = %(<div class="field-error-tag">%{tag}
        <div class="field-error-msg">%{msg}</div>
      </div>
    ).freeze

    def call(tag, obj)

      ERROR_TMPL % {
        tag: tag,
        msg: list(obj).html_safe
      }

    end # call

    private

    def list(obj)

      html = obj.error_message.inject("") { |str, error|
        str << "<li>#{error}</li>"
      }
      "<ul>#{html}</ul>"

    end # list

  end # Default

end # SimpleErrorWrapper
