class AddReviewToMangas < ActiveRecord::Migration[5.2]
    def change
        add_column :mangas, :review, :string
    end
end