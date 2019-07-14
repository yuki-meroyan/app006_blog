class CreateBlogtexts < ActiveRecord::Migration[5.0]
  def change
    create_table :blogtexts, options: "ROW_FORMAT=DYNAMIC" do |t|
      t.string      :title, null: false
      t.text        :text , null: false
      t.references  :user , null: false, foreign_key: true
      t.timestamps
    end
  end
end
