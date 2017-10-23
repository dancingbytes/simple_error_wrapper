# encoding: utf-8
require 'simple_error_wrapper/helpers_instance_tag'

require 'simple_error_wrapper/base'
require 'simple_error_wrapper/bootstrap'
require 'simple_error_wrapper/materialize'
require 'simple_error_wrapper/default'

ActionView::Helpers::Tags::Base.send  :include, ::SimpleErrorWrapper::HelpersInstanceTag
