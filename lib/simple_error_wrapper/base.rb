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
        ::ActionView::Base.field_error_proc.call(html_tag, self).html_safe
      else
        html_tag
      end

    end # error_wrapping

  end # HelpersInstanceTag

  class ErrorMessage
  end # ErrorMessage

end # SimpleErrorWrapper
