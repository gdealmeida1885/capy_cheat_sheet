

describe 'Forms' do 
  before :each do
    visit '/login'
  end

  it 'should login successfully' do 
    fill_in 'userId', with: 'stark'
    fill_in 'passId', with: 'jarvis!'
    click_button 'Login'
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
  end

  it 'should not login with invalid user' do
    fill_in 'userId', with: 'spidey'
    fill_in 'passId', with: 'jarvis!'
    click_button 'Login'
    expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
  end

  it 'should not login with invalid pass' do
    fill_in 'userId', with: 'stark'
    fill_in 'passId', with: 'avengers_assemble'
    click_button 'Login'
    expect(find('#flash')).to have_content 'Senha é invalida!'
  end
end