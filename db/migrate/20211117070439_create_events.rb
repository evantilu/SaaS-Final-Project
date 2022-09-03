class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      #Add event title, content, start time, duration
      t.string :title
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end