class CreatePdf2s < ActiveRecord::Migration
  def self.up
    create_table :pdf2s do |t|
      t.string :htmlcontent

      t.timestamps
    end
  end

  def self.down
    drop_table :pdf2s
  end
end
