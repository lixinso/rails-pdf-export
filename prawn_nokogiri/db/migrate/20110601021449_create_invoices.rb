class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.text :html_content

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
