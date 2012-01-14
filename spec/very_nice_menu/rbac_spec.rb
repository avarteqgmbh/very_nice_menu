require 'spec_helper'

describe VeryNiceMenu::Rbac do
  context "Menu Permissions" do
    it "should create a simple menu being visible to everyone" do
      menu = VeryNiceMenu.build('Main Menu')   
      menu.allowed_for?(:everyone).should be_true
      menu.allowed_for?(:never_thought_of_this_one_before).should be_true
    end
    
    it "should create a simple menu being visible only to admins" do
      menu = VeryNiceMenu.build('Main Menu', :allowed_for => [:admin])      
      menu.allowed_for?(:everone).should be_false
      menu.allowed_for?(:never_thought_of_this_one_before).should be_false
      menu.allowed_for?(:admin).should be_true
    end
  end
  
  context "Menu Entry Permissions" do
     it "should create a simple menu being visible to everyone" do
       menu = VeryNiceMenu::Entry.new('My Entry')   
       menu.allowed_for?(:everyone).should be_true
     end

     it "should create a simple menu being visible only to admins" do
       menu = VeryNiceMenu::Entry.new('My Entry', :allowed_for => [:admin])      
       menu.allowed_for?(:everone).should be_false
       menu.allowed_for?(:never_thought_of_this_one_before).should be_false
       menu.allowed_for?(:admin).should be_true
     end
  end
  
  context "Visiblity Inheritance" do
    it "should build a menu and inherit visibility" do
      menu = VeryNiceMenu.build('Main Menu', :allowed_for => [:admin])    
    
      menu.submenu("Main Menu - Submenu 1") do |submenu|        
        submenu.entry("My Entry")
      end
    
      submenu = menu.submenus.first
      entry   = submenu.entries.first
    
      menu.allowed_for?(:admin).should be_true
      menu.allowed_for?(:somebody).should be_false
      menu.allowed_for?(:everyone).should be_false
 
      submenu.allowed_for?(:admin).should be_true          
      
      submenu.allowed_for?(:somebody).should be_false
      menu.allowed_for?(:everyone).should be_false
      
      entry.allowed_for?(:admin).should be_true
      entry.allowed_for?(:somebody).should be_false
      menu.allowed_for?(:everyone).should be_false      
    end
    
    it "should build a menu and NOT inherit visibility" do
      menu = VeryNiceMenu.build('Main Menu', :allowed_for => [:admin], :inherit_permissions => false)    
    
      menu.submenu("Main Menu - Submenu 1", :inherit_permissions => false) do |submenu|        
        submenu.entry("My Entry")
      end
    
      submenu = menu.submenus.first
      entry   = submenu.entries.first
    
      menu.allowed_for?(:admin).should be_true
      menu.allowed_for?(:everyone).should be_false
      menu.allowed_for?(:somebody).should be_false
      
      # Now it should not inerhit permissions and set default permissions which means visibility for everyone
      submenu.allowed_for?(:admin).should be_true
      
      submenu.allowed_for?(:everyone).should be_true
      submenu.allowed_for?(:somebody).should be_true
      
      entry.allowed_for?(:admin).should be_true
      entry.allowed_for?(:everyone).should be_true
      entry.allowed_for?(:somebody).should be_true     
    end
  end
end