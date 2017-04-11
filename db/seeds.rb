# Run this rask to seed with the right environment
# rake db:seed RAILS_ENV=production

load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))