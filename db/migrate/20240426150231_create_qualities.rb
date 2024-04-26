class CreateQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :qualities do |t|

      t.timestamps
    end
  end
end
