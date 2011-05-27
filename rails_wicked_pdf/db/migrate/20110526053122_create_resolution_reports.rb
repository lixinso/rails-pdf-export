class CreateResolutionReports < ActiveRecord::Migration
  def self.up
    create_table :resolution_reports do |t|
      t.text :show

      t.timestamps
    end
  end

  def self.down
    drop_table :resolution_reports
  end
end
