# Welcome to Ghostwriter
---
## The Team
- Ken Saganski: [saganawski](https://github.com/saganawski)
- Armando Dollia: [armandodollia](https://github.com/armandodollia)
- Mike Bonetti: [MikeyB303](https://github.com/MikeyB303)

## Purpose
Ghostwriter is a simple yet powerful web-app designed to help people write in the styles of Shakespeare, J.K. Rowling, and George R.R. Martin by suggesting words for the user to use while writing.

Using a self-made [parser/Markov chain generator algorithm](https://github.com/saganawski/ghostwriter), we are able to break down each of the authors' works into chains of word-pairs of one, two, and three n-grams. As the user writes a new post, their writing is matched with word-pairs of the selected author's writings which then presents the user with a few suggestions based off of the probability that a certain word will follow another word or word-pair.

For example: if the user is using the George R.R. Martin library amd types "You know nothing", the app might suggest "Jon" as in "Jon Snow"

## Dependencies
To run this web app on your own, it is required that you have [rails](https://github.com/rails/rails) and [bundler](https://github.com/bundler/bundler) installed. 

To install them, run the following commands in your terminal:
`$ gem install rails`
`@ gem install bundler`
## Getting Started
1. Clone this repository to your local computer
    `$ git clone https://github.com/MikeyB303/ghostwritr-web.git`

2. Navigate to the newly cloned repo.
    `$ cd wherever-you-cloned-the-repo-to/ghostwritr-web`

3. Install dependencies using bundler.
    `$ bundle install`

4. Start a local rails server.
    `$ rails server` or `$ rails s`

5. In your web browser, navigate to [localhost:3000](localhost:3000) to view the app.

6. Click on the pulsing '+' icon in the bottom right corner of the page to make a new post using the word predictor. If you want to save your post, you'll need to register as a new user.

7.  To edit, delete, or publish a post you've made, click on the options button in the bottom right corner of the screen while viewing your post to reveal the options bar along the bottom the screen. 

## Contributing
If you'd like to contribute to Ghoswriter, simply fork this repo, make your desired changes, and create a pull request for us to review. If all is good, we'll accept your changes!
## Code Status
![code-status](https://circleci.com/gh/MikeyB303/ghostwritr-web.svg?style=shield&circle-token=:circle-token)

## License
Ghostwriter is released under the [MIT License](https://opensource.org/licenses/MIT)
