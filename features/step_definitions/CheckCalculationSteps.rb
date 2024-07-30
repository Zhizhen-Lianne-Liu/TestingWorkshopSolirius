

Then('I should see the submitted answers') do
  within('div.gem-c-summary-list') do
    expect(page).to have_css('dd.govuk-summary-list__value')
    expect(page).to have_css('dd.govuk-summary-list__value', text: 'hours worked per week')
    expect(page).to have_css('dd.govuk-summary-list__value', text: 'for a full leave year')
    expect(page).to have_css('dd.govuk-summary-list__value')
    expect(page).to have_css('dd.govuk-summary-list__value')
  end
end


When('I select option for change hours worked per week') do
  all(:link, 'Change')[3].click
end

When('I select option for change employee irregular hours') do
  all(:link, 'Change')[0].click
end


