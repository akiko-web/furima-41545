class CreateItemRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :item_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
