class CreateMultiples < ActiveRecord::Migration
  def change
    create_table :multiples do |t|
      t.string :multiple
      t.timestamps null: false
    end
  end
end
