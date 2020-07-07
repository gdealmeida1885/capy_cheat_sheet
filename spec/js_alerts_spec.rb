describe 'JS Alerts', :jsAlerts do
  before(:each) do
    visit '/javascript_alerts'
  end

  it 'should read an alert message' do
    click_button 'Alerta'
    message = page.driver.browser.switch_to.alert.text
    expect(message).to eql 'Isto é uma mensagem de alerta'
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
end
