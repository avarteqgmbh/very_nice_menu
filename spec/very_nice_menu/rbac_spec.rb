require 'spec_helper'

describe VeryNiceMenu::Rbac do
  context "Menu Permissions" do
    it "should create a simple menu being visible to everybody" do
      menu = VeryNiceMenu.build('Main Menu')   
      menu.allowed_for?(:everyone).should be_true
    end
    
    it "should create a simple menu being visible only to admins" do
      menu = VeryNiceMenu.build('Main Menu', :allowed_for => [:admin])      
      menu.allowed_for?(:everone).should be_false
      menu.allowed_for?(:never_thought_of_this_one_before).should be_false
      menu.allowed_for?(:admin).should be_true
    end
  end
  
  context "Menu Entry Permissions" do
     it "should create a simple menu being visible to everybody" do
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
end