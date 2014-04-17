class AddApplicationUrlToApiKey < ActiveRecord::Migration
  def change
    add_column :api_keys, :application_url, :string
  end
end
