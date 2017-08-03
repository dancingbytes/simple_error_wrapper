# encoding: utf-8
require 'simple_error_wrapper/base'

if defined?(::Bootstrap)
  require 'simple_error_wrapper/bootstrap'
elsif defined?(::Materialize)
  require 'simple_error_wrapper/materialize'
else
  require 'simple_error_wrapper/default'
end

ver, maj, min = Rails.version.split(".").map!(&:to_i)

if defined?(ActionView)

  ActionView::Base.send :include, ::SimpleErrorWrapper::ActionViewBase
  if ver < 4
    ActionView::Helpers::InstanceTag.send :include, ::SimpleErrorWrapper::HelpersInstanceTag
  else
    ActionView::Helpers::Tags::Base.send  :include, ::SimpleErrorWrapper::HelpersInstanceTag
  end

end # if
