class CreateRobots < ActiveRecord::Migration[6.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :image_url
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
