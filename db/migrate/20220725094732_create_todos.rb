class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      #t.string :taskVal
      #t.integer :done
    end
  end
end
