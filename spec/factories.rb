FactoryGirl.define do

  factory :very_nice_menu, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
  end
  
  factory :very_nice_nested_menu_with_submenus, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
    submenus { [FactoryGirl.build(:very_nice_menu), FactoryGirl.build(:very_nice_menu)] }
  end
end