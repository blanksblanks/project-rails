namespace :dataset do

  desc "Pull the data from the csv"
  task populate_names: :environment do
    Name.populate_data_from_csv
  end
end
