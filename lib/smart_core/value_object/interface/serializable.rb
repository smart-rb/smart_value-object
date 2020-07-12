# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::ValueObject::Interface::Serializable
  class << self
    # @param base_klass [Class<SmartCore::ValueObject>]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.include(AsHash)
    end
  end

  # @api private
  # @since 0.1.0
  module AsHash
    # @return [Hash<Symbol,Any>]
    #
    # @note strongly dependes on SmartCore::Initializer implementation
    #
    # @api public
    # @since 0.1.0
    def to_h
      __collect_params__.merge(__collect_options__)
    end
    alias_method :to_hash, :to_h
    alias_method :as_hash, :to_h
  end
end
