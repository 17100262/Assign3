# Add a declarative step here for populating the DB with movies.
x = 0
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    x=x+1
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  indexe1= page.body.index(e1)
  indexe2= page.body.index(e2)
  if(e1==nil or e2==nil)
    assert false
  else
    assert e1<e2
  end
  #  page.body is the entire content of the page as a string.
  # flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  all_ratings=rating_list.split(",")
  if (uncheck==nil)
    all_ratings.each do |r|
      rr =r.gsub("\"","")
      page.check("ratings["+rr+"]")
    end
  else
    all_ratings.each do |r|
      rr =r.gsub("\"", "")
      page.uncheck("ratings["+rr+"]")
    end
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  # flunk "Unimplemented"
end

Then /I should see all the movies/ do
  # assert (==x)
  assert page.should have_css("table#movies tr", :count==x)
  # assert 10==10
  # Make sure that all the movies in the app are visible in the table
  # flunk "Unimplemented"
  
end
