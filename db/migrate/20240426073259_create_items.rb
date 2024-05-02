class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.integer    :price,          null: false
      t.references :user,           null: false, foreign_key: true
      t.text       :content,        null: false
      t.integer    :genre_id,       null: false
      t.integer    :quality_id,     null: false
      t.integer    :payment_id,     null: false
      t.integer    :prefecture_id,  null: false
      t.integer    :days_id,        null: false
      t.timestamps
    end
  end
end
