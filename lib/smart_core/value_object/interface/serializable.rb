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
    def included(base_klass); end
  end
end
