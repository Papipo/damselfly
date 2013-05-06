module Damselfly
  class Attachment < ActiveRecord::Base
    belongs_to :file, class_name: "Damselfly::File"
    belongs_to :attachable, polymorphic: true
    delegate :data, :md5, :size, to: :file
    before_validation :avoid_duplicates
    after_destroy :delete_orphan_files
    after_save  :delete_nullified_attachments
    validates_presence_of :association_name, :filename, :file
    
    def data=(value)
      self.file.file = value
      self.filename = value.original_filename
    end
    
    def file
      super || build_file
    end
    
    protected
    def avoid_duplicates
      if existing = File.where(md5: md5, size: size).first
        self.file = existing
      end
    end
    
    def delete_orphan_files
      file.destroy if file.attachments.count.zero?
    end
    
    def delete_nullified_attachments
      destroy unless attachable
    end
  end
end
