# encoding: utf-8
module SimpleErrorWrapper

  module Default

    def call(tag, obj)

      %s(<div class="field-error-tag">%{tag}
          <div class="field-error-msg">%{msg}</div>
        </div>
      ).to_s % {
        :tag => tag,
        :msg => list(obj).html_safe
      }

    end # call

    def list(obj)

      html = obj.error_message.inject("") { |str, error|
        str << "<li>#{error}</li>"
      }
      "<ul>#{html}</ul>"

    end # list

  end # Default

end # SimpleErrorWrapper

::SimpleErrorWrapper::ErrorMessage.send :extend, ::SimpleErrorWrapper::Default
