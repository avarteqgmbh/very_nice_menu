require 'spec_helper'

describe VeryNiceMenu::Menu do
    
  context "Basics" do
    it "should create a single menu instance" do
      main_menu = VeryNiceMenu.build('Main Menu')
      main_menu.should be_instance_of(VeryNiceMenu::Menu)
      main_menu.name.should eql("Main Menu")
    end
  
    it "should create a single menu instance" do
      main_menu = VeryNiceMenu.build('Main Menu', :description => "This is a very nice menu")
      main_menu.should be_instance_of(VeryNiceMenu::Menu)
      main_menu.options[:description].should eql("This is a very nice menu")
    end
    
    it "should create a menu with a single menu entry" do
      main_menu = VeryNiceMenu.build('Main Menu')
      main_menu.entry("Nice Entry")
      main_menu.entries.should have(1).item
      main_menu.entries.first.should be_instance_of(VeryNiceMenu::Entry)
    end
  end
  
  context "FactoryGirl" do
    it "should create a single menu instance using factory girl" do
      menu = FactoryGirl.build(:very_nice_menu)
    end
    
    it "should create a menu with submenus using factory girl" do
      menu = FactoryGirl.build(:very_nice_nested_menu_with_submenus)
      menu.submenus.should have(2).items
      menu.submenus.first.should be_instance_of(VeryNiceMenu::Menu)
    end
  end  
  
  context "Simple Nesting" do
    it "should create a simple nested menu" do
      main_menu = VeryNiceMenu.build('Main Menu')
    
      main_menu.submenu("Main Menu - Submenu 1") do |submenu|        
      end    
      
      main_menu.submenus.should have(1).item
      main_menu.submenus.first.should be_instance_of(VeryNiceMenu::Menu)
    end
    
    it "should create a simple nested menu with a menu entry at submenu level" do
      main_menu = VeryNiceMenu.build('Main Menu')
    
      main_menu.submenu("Main Menu - Submenu 1") do |submenu|        
        submenu.entry("Nice Entry")        
      end    
      
      main_menu.submenus.first.entries.should have(1).items
      main_menu.submenus.first.entries.first.should be_instance_of(VeryNiceMenu::Entry)
    end
  end
  
  context "Bottom up traversal" do
    it "should be possible to find the parent menu of a certain entry" do
      main_menu = VeryNiceMenu.build('Main Menu')
    
      main_menu.submenu("Main Menu - Submenu 1") do |submenu|        
        submenu.entry("Nice Entry")        
      end
    end
  end
end