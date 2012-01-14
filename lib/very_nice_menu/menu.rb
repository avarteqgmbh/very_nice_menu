module VeryNiceMenu
  class Menu
    attr_accessor :name, :options
    attr_reader   :submenus       
    attr_reader   :entries
        
    def initialize(name, options = {})
      @name     = name
      @options  = options
      @submenus = []
      @entries  = []
    end    
    
    def submenu(name, options = {}, &block)
      menu = Menu.new(name, options)
      yield(menu)
      @submenus << menu
    end
    
    def entry(name, options = {})
      @entries << VeryNiceMenu::Entry.new(name, options)
    end
  end
end