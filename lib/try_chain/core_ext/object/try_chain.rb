require 'try_chain'

class Object
  include ::TryChain::InstanceMethods
end

class NilClass
  def try_chain(*args)
    return nil
  end
end
