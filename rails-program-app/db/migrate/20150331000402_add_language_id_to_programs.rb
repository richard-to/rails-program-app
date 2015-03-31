class AddLanguageIdToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :language, index: true
    add_foreign_key :programs, :languages
  end
end
