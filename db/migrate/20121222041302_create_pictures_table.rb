class CreatePicturesTable < ActiveRecord::Migration
  def up
    create_table :pictures do |t|
      t.string :url
      t.timestamps
    end
  end

  def down
    drop_table :pictures
  end
end
