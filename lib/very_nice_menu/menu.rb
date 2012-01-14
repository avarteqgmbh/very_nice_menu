module VeryNiceMenu
  class Menu
    attr_accessor :name, :options
    attr_accessor :submenus, :entries
    attr_accessor :parent
        
    def initialize(name = "", options = {}, parent = nil)
      @name     = name
      @options  = options
      @parent   = parent
      @submenus = []
      @entries  = []
    end    
    
    def submenu(name, options = {}, parent = nil, &block)
      menu = Menu.new(name, options, self)
      yield(menu)
      @submenus << menu
    end
    
    def entry(name, options = {})
      @entries << VeryNiceMenu::Entry.new(name, options, self)
    end
  end
end