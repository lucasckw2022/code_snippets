class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :type
      t.text :content

      t.timestamps null: false
    end
  end
end
