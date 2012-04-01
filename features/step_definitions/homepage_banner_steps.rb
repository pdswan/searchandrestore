Then /^I should see the homepage banner$/ do
  page.should have_css("img[src^='#{the.homepage_banner.image.url}']")
end

Then /^the homepage banner should link to it's url$/ do
  within "a[href='#{the.homepage_banner.url}'][target=_blank]" do
    Then 'I should see the homepage banner'
  end
end
