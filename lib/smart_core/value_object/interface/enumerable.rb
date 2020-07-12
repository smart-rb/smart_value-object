# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::ValueObject::Interface::Enumerable
  class << self
    # @param base_klass [Class<SmartCore::ValueObject>]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.include(::Enumerable)
      base_klass.include(Enumerability)
    end
  end

  # @api private
  # @since 0.1.0
  module Enumerability
    # @param block [Block]
    # @return [Enumerable]
    #
    # @api public
    # @since 0.1.0
    def each(&block)
      block_given? ? yield(self) : (Enumerator.new { |yielder| yielder.yield(self) }.each)
    end
  end
end
