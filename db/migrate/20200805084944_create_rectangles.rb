class CreateRectangles < ActiveRecord::Migration[6.0]
  def change
    create_table :rectangles do |t|
      t.string :colors
      t.string :text
      
      t.timestamps
    end
  end
end
