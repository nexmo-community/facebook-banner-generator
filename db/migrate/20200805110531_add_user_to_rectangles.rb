class AddUserToRectangles < ActiveRecord::Migration[6.0]
  def change
    add_reference :rectangles, :user, foreign_key: true
  end
end
