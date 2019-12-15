

describe 'dropdown list' do 
  before :each do 
    visit '/dropdown'
  end
  
  it 'should select using id' do 
    select 'Natasha Romanoff', from: 'dropdown'
  end

  it 'should select using class' do
    dropdown = find('.avenger-list')
    dropdown.find('option', text: 'Tony Stark').select_option
  end

  it 'should select using a sample' do
    dropdown = find('.avenger-list')
    dropdown.all('option').sample.select_option
  end
end