Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
  puts User.all
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create(article)
  end
  puts Article.all
end

Given /the following comments exist/ do |feedbacks_table|
  feedbacks_table.hashes.each do |feedback|
    Feedback.create(feedback)
  end
end

Given /comment for article 1 exists/ do
  visit path_to("the home page")
  text = "Surfing elephant"
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
  link = text
  click_link(link)
  fill_in("comment_body", :with => "Comment 1")
end

Given /am not an admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'publisher'
  fill_in 'user_password', :with => 'p12345'
  click_button 'Login'
end



Given /^I am logged in as admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'a12345'
  click_button 'Login'
end

Then /^I should not see the "(.*?)" form$/ do |name|
  if page.respond_to? :should
    page.should have_no_content(name)
  else
    assert page.has_no_content?(name)
  end
end






