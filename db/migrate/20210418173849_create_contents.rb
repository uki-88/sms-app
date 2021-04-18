class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string     :to_do, null: false
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
