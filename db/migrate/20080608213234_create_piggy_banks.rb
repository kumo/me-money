class CreatePiggyBanks < ActiveRecord::Migration
  def self.up
    add_column :accounts, :type, :string
    add_column :accounts, :goal_in_pence, :integer
    add_column :accounts, :due_on, :date
  end

  def self.down
    remove_column :accounts, :type
    remove_column :accounts, :goal_in_pence
    remove_column :accounts, :due_on, :date
  end
end
