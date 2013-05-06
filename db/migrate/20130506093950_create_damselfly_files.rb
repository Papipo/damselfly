class CreateDamselflyFiles < ActiveRecord::Migration
  def change
    create_table :damselfly_files do |t|
      t.string  :file_uid
      t.string  :md5
      t.integer :size
    end
    
    add_index :damselfly_files, [:md5, :size], unique: true
  end
end