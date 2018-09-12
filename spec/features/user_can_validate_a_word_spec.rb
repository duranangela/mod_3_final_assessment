require 'rails_helper'

describe 'User can validate a word' do
  it 'with a valid word' do
    visit '/'

    fill_in :word, with: 'foxes'
    click_on 'Validate Word'

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
  end
  it 'gets error message with invalid word' do
    visit '/'

    fill_in :word, with: 'foxez'
    click_on 'Validate Word'

    expect(page).to have_content("'foxez' is a not a valid word")
  end

end
