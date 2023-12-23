class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :first_name
      t.string :last_name
      t.string :school
      t.string :nation
      t.string :best_work

      t.timestamps
    end
  end
end
