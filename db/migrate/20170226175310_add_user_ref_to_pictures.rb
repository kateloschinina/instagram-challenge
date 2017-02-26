class AddUserRefToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :picture, foreign_key: true
  end
end
