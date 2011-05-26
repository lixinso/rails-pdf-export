class CreatePdfs < ActiveRecord::Migration
  def self.up
    create_table :pdfs do |t|
      t.text :content1

      t.timestamps
    end
  end

  def self.down
    drop_table :pdfs
  end
end
