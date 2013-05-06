class CreateDamselflyAttachments < ActiveRecord::Migration
  def change
    create_table :damselfly_attachments do |t|
      t.string :association_name
      t.string :filename
      t.belongs_to :attachable, polymorphic: true
      t.belongs_to :file
      
      t.timestamps
    end
    
    add_index :damselfly_attachments, :file_id
    add_index :damselfly_attachments, [:attachable_id, :attachable_type], name: "index_damselfly_on_attachable"
  end
end
