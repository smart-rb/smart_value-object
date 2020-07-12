# frozen_string_literal: true

# @api private
# @since 0.1.0
module SmartCore::ValueObject::Interface::Constructor
  class << self
    # @param base_klass [Class<SmartCore::ValueObject>]
    # @return [void]
    #
    # @api private
    # @since 0.1.0
    def included(base_klass)
      base_klass.include(::SmartCore::Initializer)
      base_klass.singleton_class.class_eval do
        alias_method :attribute, :param
        alias_method :property, :option
        alias_method :attributes, :params
        alias_method :properties, :options
      end
      base_klass.include(AttributeAccess)
      base_klass.extend_initialization_flow(&ImmutabilityControl)
    end
  end

  # @api private
  # @since 0.1.0
  module AttributeAccess
    # @return [Hash<Symbol,Any>]
    #
    # @note strongly dependes on SmartCore::Initializer implementaiton
    #
    # @api public
    # @since 0.1.0
    def __attributes__
      __collect_params__
    end

    # @return [Hash<Symbol,Any>]
    #
    # @note strongly dependes on SmartCore::Initializer implementaiton
    #
    # @api public
    # @since 0.1.0
    def __properties__
      __collect_options__
    end

    # @return [Hash<Symbol,Any>]
    #
    # @note strongly dependes on SmartCore::Initializer implementaiton
    #
    # @api public
    # @since 0.1.0
    def __params__
      __collect_params__.merge(__collect_options__)
    end
  end

  # @api private
  # @since 0.1.0
  module ImmutabilityControl
    class << self
      # @param instance [SmartCore::ValueObject]
      # @return [void]
      #
      # @note strongly dependes on SmartCore::Initializer implementation
      #
      # @api private
      # @since 0.1.0
      def freeze_instance(instance)
        instance.freeze unless instance.frozen?
      end

      # @return [Proc]
      #
      # @note strongly dependes on SmartCore::Initializer implementation
      #
      # @api private
      # @since 0.1.0
      def to_proc
        proc { |instance| freeze_instance(instance) }
      end
    end
  end
end
