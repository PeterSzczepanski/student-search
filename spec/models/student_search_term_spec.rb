require 'rails_helper'

RSpec.describe StudentSearchTerm do
  subject { described_class.new(search_term) }

  context 'when a single search term is entered' do
    let(:search_term) { "smi" }

    it 'structures query to search first and last name partials' do
      expect(subject.order).to eq "last_name asc"
      expect(subject.where_args.to_s).to eq "{:first_name=>\"smi%\", :last_name=>\"smi%\"}"
      expect(subject.where_clause).to eq "lower(first_name) like :first_name OR lower(last_name) like :last_name"
    end
  end

  context 'when a capitalized full name is entered' do
    let(:search_term) { "John Smith" }

    it 'structures query to only search lowercase full name, for both partials' do
      expect(subject.order).to eq "last_name asc"
      expect(subject.where_args.to_s).to eq "{:first_name=>\"john%\", :last_name=>\"smith%\"}"
      expect(subject.where_clause).to eq "lower(first_name) like :first_name AND lower(last_name) like :last_name"
    end
  end

  context 'when more than two search terms are entered' do
    # Determine how multiple name partials should be stored, interim solution...
    let(:search_term) { "ja the third" }

    it 'only uses first term in the query' do
      expect(subject.order).to eq "last_name asc"
      expect(subject.where_args.to_s).to eq "{:first_name=>\"ja%\", :last_name=>\"ja%\"}"
      expect(subject.where_clause).to eq "lower(first_name) like :first_name OR lower(last_name) like :last_name"
    end
  end
end