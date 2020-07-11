describe 'Manipulating Windows', :window do
  before(:each) do
    visit '/windows'
  end

  it 'should open a new window', :firstWay do
    new_window = window_opened_by do
      click_link 'Clique aqui'
    end

    within_window new_window do
      expect(find('.example').text).to eql 'Aqui temos uma nova janela \o/'
    end

    new_window.close
    expect(new_window.closed?)
  end

  it 'should opend a new window', :secondWay do
    new_window = window_opened_by { click_link 'Clique aqui' }

    within_window -> { page.title == 'Nova Janela' } do
      expect(find('.example').text).to eql 'Aqui temos uma nova janela \o/'
    end

    new_window.close
    expect(new_window.closed?)
  end
end
