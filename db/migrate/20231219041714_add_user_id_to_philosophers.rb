class AddUserIdToPhilosophers < ActiveRecord::Migration[7.0]
  def change
    add_column :philosophers, :user_id, :integer
    add_index :philosophers, :user_id
  end
end
