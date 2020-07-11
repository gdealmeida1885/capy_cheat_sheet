describe 'JS Alerts', :js_alerts do
  before(:each) do
    visit '/javascript_alerts'
  end

  it 'should read an alert message' do
    click_button 'Alerta'
    message = page.driver.browser.switch_to.alert.text
    expect(message).to eql 'Isto é uma mensagem de alerta'
    page.driver.browser.switch_to.alert.accept
  end

  it 'should accept an alert' do
    click_button 'Confirma'

    message = page.driver.browser.switch_to.alert.text
    expect(message).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.accept
    expect(find('#result').text).to eql 'Mensagem confirmada'
  end

  it 'should not accept an alert' do
    click_button 'Confirma'

    message = page.driver.browser.switch_to.alert.text
    expect(message).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.dismiss
    expect(find('#result').text).to eql 'Mensagem não confirmada'
  end

  it 'should accept a prompt', :accept_prompt do
    @prompt_msg = 'Gabriel Almeida'
    # Can be done this way
    # click_button 'Prompt'
    # accept_prompt(with: 'Gabriel')

    # Can also be done this way

    accept_prompt(with: @prompt_msg) do
      click_button 'Prompt'
    end
    expect(find('#result').text).to eql "Olá, #{@prompt_msg}"
  end

  it 'should dismiss a prompt', :dimiss_prompt do 
    click_button 'Prompt'
    dismiss_prompt
    expect(find('#result').text).to eql "Olá, null"
  end
end
