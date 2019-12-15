

describe 'radio buttons' do 
  before :each do 
    visit '/radios'
  end

  it 'should choose an option' do 
    choose 'cap'
  end

  it 'should click an option' do
    find('input[value=iron-man').click
  end
end
