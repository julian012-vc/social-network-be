class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :type_reaction

      t.timestamps
    end
  end
end
