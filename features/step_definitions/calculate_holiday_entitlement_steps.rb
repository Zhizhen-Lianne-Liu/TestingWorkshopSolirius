Given('I navigate to the homepage') do 
    visit 'https://www.gov.uk/calculate-your-holiday-entitlement'
    sleep 1
end

And('I should see the homepage') do
    expect(page).to have_title 'Calculate holiday entitlement - GOV.UK'
    expect(page).to have_css 'h1.govuk-heading-xl'
    expect(page).to have_link 'Start now'
    expect(page).to have_content 'Use this tool to calculate holiday entitlement for:'
end

When ("I click on the 'Start now' button") do
    click_link('Start now') 
    
end

And("I select the option no for working irregular hours") do
    choose('No', allow_label_click: 'true')
    click_button('Continue')
    
    
end

And ('I select the option hours worked per week') do
    choose('hours worked per week', allow_label_click: 'true')
    click_button('Continue')
   
end

And ('I select the option for a full leave year') do
    choose('for a full leave year', allow_label_click: 'true')
    click_button('Continue')
    expect(page).to have_current_path('https://www.gov.uk/calculate-your-holiday-entitlement/y/regular/hours-worked-per-week/full-year')
end

# And ('I input 37.5 hours worked per week') do
#     fill_in('hours worked', with: '37.5')
#     click_button('Continue')
    
     
# end

And ('I input 5 days worked per week') do
    fill_in('Number of days worked per week', with: '5')
    click_button('Continue')
    
    
end

Then('I should see the correct submitted answers') do
    within('div.gem-c-summary-list') do
      expect(page).to have_css('dd.govuk-summary-list__value', text: 'No')
      expect(page).to have_css('dd.govuk-summary-list__value', text: 'hours worked per week')
      expect(page).to have_css('dd.govuk-summary-list__value', text: 'for a full leave year')
      expect(page).to have_css('dd.govuk-summary-list__value', text: '37.5')
      expect(page).to have_css('dd.govuk-summary-list__value', text: '5.0')
    end
  end
  

And ('I should see the total entitlement hours') do
    expect(page).to have_content 'The statutory entitlement is 210 hours holiday'

    
end


And("I select the option yes for working irregular hours") do
    choose('Yes', allow_label_click: true)
    click_button('Continue')
    expect(page).to have_current_path('https://www.gov.uk/calculate-your-holiday-entitlement/y/irregular-hours-and-part-year')
    
end

And ('I enter when the leave year starts') do
    fill_in('Day', with: '1')
    fill_in('Month', with: '1')
    fill_in('Year', with: '2023')
    click_button('Continue')
    
end

And ('I select the option days worked per week') do
    choose('days worked per week', allow_label_click: true)
    click_button('Continue')
    
end

And ('I select for someone leaving part way through a leave year') do
    choose('for someone leaving part way through a leave year', allow_label_click: true)
    click_button('Continue')
end

And ('I enter employment end date') do
    fill_in('Day', with: '8')
    fill_in('Month', with: '8')
    fill_in('Year', with: '2023')
    click_button('Continue')
end

And ('I enter 3 days worked per week') do
    fill_in('Number of days worked per week?', with: '3')
    click_button('Continue')
end

Then ('I should see the total entitlement hours irregular') do
    expect(page).to have_content('The statutory holiday entitlement is 10.2 days holiday.')
end

And ('I should see the correct submitted answers irregular') do
    expect(page).to have_css('dd.govuk-summary-list__value', text: 'Yes')
    expect(page).to have_css('dd.govuk-summary-list__value', text: '1 January 2023')
    expect(page).to have_css('dd.govuk-summary-list__value', text: 'days worked per week')
    expect(page).to have_css('dd.govuk-summary-list__value', text: 'for someone leaving part way through a leave year')
    expect(page).to have_css('dd.govuk-summary-list__value', text: '8 August 2023')
    expect(page).to have_css('dd.govuk-summary-list__value', text: '3.0')
end
