require 'damselfly/engine'

module Damselfly
  extend ActiveSupport::Concern
  
  included do
    has_many :attachments, as: :attachable, class_name: "Damselfly::Attachment"
  end
  
  module ClassMethods
    def has_one_attached(name)
      has_one name, as: :attachable, class_name: "Damselfly::Attachment", conditions: ["#{Damselfly::Attachment.table_name}.association_name = ?", name]
      accepts_nested_attributes_for name
      
      class_eval do
        define_method("build_#{name}") do |args, opts|
          super(args.merge!(association_name: name), opts)
        end
      end
    end
    
    def has_many_attached(name)
      has_many name, as: :attachable, class_name: "Damselfly::Attachment", conditions: ["#{Damselfly::Attachment.table_name}.association_name = ?", name], before_add: lambda { |attachable,attachment| attachment.association_name = name }
      accepts_nested_attributes_for name
    end
  end
end