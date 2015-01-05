module TrustPilot
  module SetterHelper

    def default_methods(methods, intern_class)
      methods.each do |method|
        
        define_singleton_method method do
          intern_class.instance.send(method)
        end

        intern_class.instance_eval do
          include Singleton
          attr_accessor method
        end

        method_setter = "#{method}="
        define_singleton_method method_setter do |param|
          intern_class.instance.send(method_setter, param)
        end

      end
    end
  end
end
