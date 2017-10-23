# encoding: utf-8
module SimpleErrorWrapper

  module HelpersInstanceTag

    def error_wrapping(html_tag)

      if object_has_errors?

        if self.object.respond_to?(:error_decorator)
          self.object.error_decorator(html_tag, self).html_safe
        else
          ::ActionView::Base.field_error_proc.call(html_tag, self).html_safe
        end

      else
        html_tag
      end

    end # error_wrapping

  end # HelpersInstanceTag

end # SimpleErrorWrapper
