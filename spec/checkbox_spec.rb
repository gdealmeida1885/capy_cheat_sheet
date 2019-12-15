

describe 'checkboxes' do 

  before :each do 
    visit '/checkboxes'
  end

  it 'should check a box' do
    check 'thor'
  end

  it 'should uncheck a box' do
    uncheck 'antman'
  end

  it 'should set a checkbox true' do
    find('input[value=ant-man]').set true
  end

  it 'should set a checkbox false' do
    find('input[value=guardians]').set false
  end  
end