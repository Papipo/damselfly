module Damselfly
  class File < ActiveRecord::Base
    has_many :attachments
    
    file_accessor :file do
      after_assign do |f|
        self.md5 = ::Digest::MD5.file(f.path).hexdigest
        self.size = f.size
      end
    end
    
    delegate :data, :size, to: :file
  end
end
