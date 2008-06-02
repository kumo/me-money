class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :description
      t.integer :amount_in_pence
      t.date :paid_on
      t.belongs_to :account

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
