require "very_nice_menu/version"
require "very_nice_menu/menu"
require "very_nice_menu/entry"

module VeryNiceMenu
  def self.build(name, options = {})
    VeryNiceMenu::Menu.new(name, options)
  end
end
