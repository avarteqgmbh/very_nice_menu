FactoryGirl.define do
  
  #### Entries
  
  factory :menu_entry, :class => VeryNiceMenu::Entry do
    sequence(:name) { |n| "Entry #{n}"}    
  end
  
  #### Menus

  factory :very_nice_menu, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
  end
  
  factory :very_nice_menu_with_entry, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
    
    entries { [ FactoryGirl.build(:menu_entry), FactoryGirl.build(:menu_entry)  ] }
  end
      
  factory :very_nice_nested_menu_with_submenus, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
    submenus { [FactoryGirl.build(:very_nice_menu), FactoryGirl.build(:very_nice_menu)] }
  end
  
  factory :very_nice_nested_menu_with_submenus_and_entries, :class => VeryNiceMenu::Menu do
    sequence(:name) { |n| "Menu #{n}" }
    submenus { [FactoryGirl.build(:very_nice_menu_with_entry), FactoryGirl.build(:very_nice_menu_with_entry)] }
  end
end