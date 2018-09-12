require 'rails_helper'

describe 'User can validate a word' do
  it 'through a form' do
    visit '/'

    fill_in :word, with: 'foxes'
    click_on 'Validate Word'

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
  end
end
