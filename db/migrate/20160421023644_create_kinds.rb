class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :kind

      t.timestamps null: false
    end
  end
end
