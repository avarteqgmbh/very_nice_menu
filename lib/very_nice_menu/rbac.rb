module VeryNiceMenu
  
  # Role Based Access Control
  module Rbac
    
    @@default_permissions = [:everyone]
    
    def allowed_for?(role)
      initialize_rbac_options
      @options[:allowed_for].include?(role) || @options[:allowed_for].include?(:everyone)
    end
    
    def allowed_for
      initialize_rbac_options
      @options[:allowed_for]
    end    
    
    protected 
    
    def initialize_rbac_options
      @options                        ||= {}
      @options[:inherit_permissions]  = true if @options[:inherit_permissions].nil?
      set_default_permissions_unless_permissions_given    
    end
    
    def set_default_permissions_unless_permissions_given

      # We don't overwrite anything. It's just about setting permission in case none have been set so far.
      return unless @options[:allowed_for].nil?

      if (@options[:inherit_permissions] && @parent) then
        # Inherit permissions
        @options[:allowed_for]          = @parent.allowed_for 
      else
        # Set default permissions if unset
        @options[:allowed_for]          = @@default_permissions
      end
    end
  end
end