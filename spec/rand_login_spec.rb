describe 'Random Login Fields', :randLogin do
  before(:each) do
    visit '/login2'
  end

  it 'should set correctly random fields' do
    fill_in 'userId', with: 'stark'
    fill_in 'passId', with: 'jarvis!'
    bday = find('input[name="bday"]')['id']

    if bday == 'month'
      fill_in 'month', with: '05'
    elsif bday == 'year'
      fill_in 'year', with: '1970'
    else
      fill_in 'day', with: '29'
    end

    click_button 'Login'
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
  end
end
