# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  #Title
  subject do
    described_class.new(title: 'harry potter', author: 'JK Rowling', price: '15', published: Date.today)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  #Author
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  #Price
  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  #Published Date
  it 'is not valid without a date' do
    subject.published = nil
    expect(subject).not_to be_valid
  end

end

