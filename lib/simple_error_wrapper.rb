# encoding: utf-8
module SimpleErrorWrapper

  module ActionViewBase
  
    @@field_error_proc = lambda { |html_tag, instance|
      ::SimpleErrorWrapper::ErrorMessage.call(html_tag, instance)
    }

  end # ActionViewBase

  module HelpersInstanceTag
    
    def error_wrapping(html_tag)

      if object_has_errors?
        (object.respond_to?(:field_error_proc) ? \
         object.field_error_proc.call(html_tag, self) : \
          ::ActionView::Base.field_error_proc.call(html_tag, self)).html_safe
      else
        html_tag
      end

    end # error_wrapping

  end # HelpersInstanceTag

  class ErrorMessage

    def self.call(tag, obj)

      %s(<div class="field-error-tag">%{tag}
          <div class="field-error-msg">%{msg}</div>
        </div>
      ).to_s % {
        :tag => tag,
        :msg => list(obj).html_safe
      }

    end # self.call

    def self.list(obj)

      html = obj.error_message.inject("") { |str, error|
        str << "<li>#{error}</li>"
      }
      "<ul>#{html}</ul>"
      
    end # list

  end # ErrorMessage

end # SimpleErrorWrapper

defined?(ActionView)
  ActionView::Base.send :include, SimpleErrorWrapper::ActionViewBase
  ActionView::Helpers::InstanceTag.send :include, SimpleErrorWrapper::HelpersInstanceTag
end  