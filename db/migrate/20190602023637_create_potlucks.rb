class CreatePotlucks < ActiveRecord::Migration[5.2]
  def change
    create_table :potlucks do |t|
      t.string :name
      t.date :date
      t.integer :organizer_id
    end
  end
end
