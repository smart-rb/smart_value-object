# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::ValueObject::Interface
  require_relative 'interface/constructor'
  require_relative 'interface/comparable'
  require_relative 'interface/enumerable'
  require_relative 'interface/serializable'
end
