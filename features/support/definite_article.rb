module DefiniteArticle
  def the
    @the ||= OpenStruct.new
  end
end

World(DefiniteArticle)
