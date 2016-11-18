class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :created_event, foreign_key: true
      t.references :attended_event, foreign_key: true

      t.timestamps
    end
  end
end
