# frozen_string_literal: true

require 'smart_core/initializer'

# @api pulbic
# @since 0.1.0
module SmartCore
  # @api pulbic
  # @since 0.1.0
  class ValueObject
    require_relative 'value_object/version'
    require_relative 'value_object/interface'

    # @since 0.1.0
    include Interface::Constructor
    # @since 0.1.0
    include Interface::Comparable
    # @since 0.1.0
    include Interface::Enumerable
    # @since 0.1.0
    include Interface::Serializable

    # @!method <=>(another_object)
    # @!method eql?(another_object)
    # @!method each(&block)
  end
end
