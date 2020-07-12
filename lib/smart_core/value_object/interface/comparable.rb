# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::ValueObject::Interface::Comparable
  class << self
    # @param base_klass [Class<SmartCore::ValueObject>]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.include(::Comparable)
      base_klass.include(Comparability)
    end
  end

  # @api private
  # @since 0.1.0
  module Comparability
    # @param another_object [Any]
    # @return [Boolean]
    #
    # @api public
    # @since 0.1.0
    def <=>(another_object)
      false
    end
  end
end
