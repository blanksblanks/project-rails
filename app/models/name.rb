require 'csv'

class Name
  include Mongoid::Document

  field :birth_year, type: Fixnum
  field :gender, type: String
  field :ethnicity, type: String
  field :name, type: String
  field :count, type: Fixnum
  field :rank, type: Fixnum

  def self.populate_data_from_csv
    file_path = Rails.root.join 'app', 'assets', 'csvs', 'names.csv'
    CSV.foreach(file_path, :headers => true, :col_sep => ',') do |row|
      Name.create(:birth_year => row['BRTH_YR'], :gender => row['GNDR'], :ethnicity => row['ETHCTY'], :name => row['NM'], :count => row['CNT'], :rank => row['RNK'])
    end
  end

end
