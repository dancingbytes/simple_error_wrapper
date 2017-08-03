# encoding: utf-8
module SimpleErrorWrapper

  module Materialize

    def call(tag, obj)

      doc = ::Nokogiri::HTML::DocumentFragment.parse(tag)

      doc.search('*').each { |node|
        node['class'] = "#{node['class']} invalid"
      }

      %(%{tag}<label data-error="%{msg}" class="error-label active"></label>).freeze % {
        tag: doc.inner_html,
        msg: list(obj).html_safe
      }

    end # call

    def list(obj)

      html = obj.error_message.inject([]) { |arr, error|
        arr << error
      }
      html.join('\n')

    end # list

  end # Materialize

end # SimpleErrorWrapper

::SimpleErrorWrapper::ErrorMessage.send :extend, ::SimpleErrorWrapper::Materialize
