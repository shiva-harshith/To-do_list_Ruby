class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskVal
      t.integer :done
      t.timestamps
    end
  end
end
