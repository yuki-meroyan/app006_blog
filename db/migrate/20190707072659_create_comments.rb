class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, options: "ROW_FORMAT=DYNAMIC"  do |t|
      t.string    :comment    , null: false
      t.references  :user     , null: false, foreign_key: true
      t.references  :blogtext , null: false, foreign_key: true
      t.timestamps
    end
  end
end
