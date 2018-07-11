module SimpleErrorWrapper

  module MaterializeVersion1

    ERROR_TMPL = %(%{tag}<span
      class="helper-text" data-error="%{msg}"></span>
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

  end

end