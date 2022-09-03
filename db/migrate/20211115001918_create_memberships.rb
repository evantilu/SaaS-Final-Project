class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :group, foreign_key: true, null: false

      t.timestamps
    end
  end
end