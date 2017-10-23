module SimpleErrorWrapper

  class Materialize < ::SimpleErrorWrapper::Base

    ERROR_TMPL = %(%{tag}<label
      data-error="%{msg}" class="error-label active"></label>
    ).freeze

    def call(tag, obj)

      doc = ::Nokogiri::HTML::DocumentFragment.parse(tag)

      doc.search('*').each { |node|
        node['class'] = "#{node['class']} invalid"
      }

      ERROR_TMPL % {
        tag: doc.inner_html,
        msg: list(obj).html_safe
      }

    end # call

    private

    def list(obj)

      obj.error_message.inject([]) { |arr, error|
        arr << error
      }.join('\n')

    end # list

  end # Materialize

end # SimpleErrorWrapper
