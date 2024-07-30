
And('I input {float} hours worked per week') do |float|
    fill_in('hours worked', with: float)
    click_button('Continue')
  end
  
  Then('I should see the submitted answers') do
    within('div.gem-c-summary-list') do
      expect(page).to have_css('dd.govuk-summary-list__value')
      expect(page).to have_css('dd.govuk-summary-list__value', text: 'hours worked per week')
      expect(page).to have_css('dd.govuk-summary-list__value', text: 'for a full leave year')
      expect(page).to have_css('dd.govuk-summary-list__value')
      expect(page).to have_css('dd.govuk-summary-list__value')
    end
  end
  
  And('I should see the total entitlement hours displayed') do
    expect(page).to have_content 'The statutory entitlement is 210 hours holiday'
  end
  
  When('I select option for change hours worked per week') do
    all(:link, 'Change')[3].click
  end
  

  
  Then ('I should see the total entitlement hours {float}') do |float|
    num = float == float.to_i ? float.to_i : float
    expect(page).to have_content('The statutory entitlement is ' + num.to_s + ' hours holiday.')
end





