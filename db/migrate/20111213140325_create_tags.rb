class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :reference_id

      t.timestamps
    end
  end
end
