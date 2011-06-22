module DefiniteArticle
  def the
    @the ||= LazyPopulator.new
  end

  class LazyPopulator < OpenStruct
    def method_missing(method, *args)
      if (method_string = method.to_s) =~ /=$/
        super
      else
        klass = method_string.camelize.constantize
        send(:"#{method_string}=", klass.last)
      end
    end
  end
end

World(DefiniteArticle)
