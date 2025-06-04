class AddVideoUrlToTrainingPage < ActiveRecord::Migration[7.1]
  def change
    add_column :training_pages, :video_url, :string
  end
end
