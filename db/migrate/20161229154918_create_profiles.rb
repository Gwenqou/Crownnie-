class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
