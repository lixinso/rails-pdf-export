class CreatePdf3s < ActiveRecord::Migration
  def self.up
    create_table :pdf3s do |t|
      t.text :htmlcontent

      t.timestamps
    end
  end

  def self.down
    drop_table :pdf3s
  end
end
