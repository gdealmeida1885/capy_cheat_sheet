describe 'Form With Login', :formLogin do
  before(:each) do
    visit '/access'
  end

  it 'should fill in a login form' do
    login_form = find('form[id="login"]')

    within(login_form) do
      fill_in 'username', with: 'stark'
      fill_in 'password', with: 'jarvis!'
      click_button 'Entrar'
    end

    expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
  end

  it 'should fill a sign up form' do
    sign_up = find('form[id="signup"]')

    within(sign_up) do
      fill_in 'username', with: 'stark'
      fill_in 'password', with: 'jarvis!'
      click_link 'Criar Conta'
    end

    expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
  end
end
