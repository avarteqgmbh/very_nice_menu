module VeryNiceMenu
  
  # Role Based Access Control
  module Rbac
    
    @@default_permissions = [:everyone]
    
    def allowed_for?(role)
      @options               ||= {}
      @options[:allowed_for] ||= @@default_permissions
      @options[:allowed_for].include?(role)
    end    
  end
end