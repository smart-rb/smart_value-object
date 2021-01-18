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
    def <(another_object)
      false
    end

    # @param another_object [Any]
    # @return [Boolean]
    #
    # @api public
    # @since 0.1.0
    def <=(another_object)
      false
    end

    # @param another_object [Any]
    # @return [Boolean]
    #
    # @api public
    # @since 0.1.0
    def >(another_object)
      false
    end

    # @param another_object [Any]
    # @return [Boolean]
    #
    # @api public
    # @since 0.1.0
    def >=(another_object)
      false
    end

    # @param another_object [SmartCore::ValueObject]
    # @return [Boolean]
    #
    # @api public
    # @since 0.1.0
    # rubocop:disable Style/RedundantSelf
    def eql?(another_object)
      self.class <= another_object.class && (
        self.class.__params__.all? do |attribute|
          self.__send__(attribute.name) == another_object.__send__(attribute.name)
        end
      ) && (
        self.class.__options__.all? do |property|
          self.__send__(property.name) == another_object.__send__(property.name)
        end
      )
    end
    alias_method :==, :eql?
    # rubocop:enable Style/RedundantSelf
  end
end
