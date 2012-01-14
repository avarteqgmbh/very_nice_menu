module VeryNiceMenu
  class Entry
    attr_accessor :name, :options, :parent
    
    def initialize(name = "", options = {}, parent = nil)
      @name     = name
      @options  = options
      @parent   = parent
    end
  end
end