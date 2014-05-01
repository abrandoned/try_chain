require "try_chain/version"
require "active_support/core_ext/object/try"

module TryChain

  def self.proxy_try_chain(object, *chain)
    object.extend(::TryChain::InstanceMethods)

    return object.try_chain(chain)
  end

  def self.proxy_try_chain!(object, *chain)
    object.extend(::TryChain::InstanceMethods)

    return object.try_chain!(chain)
  end

  class << self
    alias_method :call, :proxy_try_chain
    alias_method :proxied_try_chain, :proxy_try_chain
    alias_method :call!, :proxy_try_chain!
    alias_method :proxied_try_chain!, :proxy_try_chain!
  end

  module InstanceMethods
    def try_chain(*symbols)
      return nil if self.nil?

      symbols = symbols.flatten
      symbols.compact!

      symbols.reduce(self) do |result, symbol|
        result = result.try do |selph|
          selph.__send__(symbol) if selph.respond_to?(symbol, true)
        end

        break nil if result.nil?
        result
      end
    end

    def try_chain!(*symbols)
      return nil if self.nil?

      symbols = symbols.flatten
      symbols.compact!

      symbols.reduce(self) do |result, symbol|
        result = result.try! do |selph|
          selph.__send__(symbol)
        end

        break nil if result.nil?
        result
      end
    end
  end
end
