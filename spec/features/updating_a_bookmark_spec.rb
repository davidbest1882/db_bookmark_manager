feature 'Feature - updating a bookmark' do
  scenario 'a user can update a bookmark' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    visit('/bookmarks')
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")

    first('.bookmark').click_button 'Edit'

    fill_in('title', with: "Snakers Academy")
    fill_in('url', with: "http://www.snakersacademy.com")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link("Snakers Academy", href: "http://www.snakersacademy.com")
  end
end
