# Facebook Messenger Banner Generator Chatbot

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.txt)

<img src="https://developer.nexmo.com/assets/images/Vonage_Nexmo.svg" height="48px" alt="Nexmo is now known as Vonage" />

This repository contains the code for a working Facebook Messenger Chatbot that allows users to create banner images with custom text and randomly selected colors.

* [Prerequisites](#prerequisites)
* [Installation and Usage](#installation-and-usage)
* [Contributing](#contributing)
* [License](#license)

## Prerequisites

In order to use this application you need to have:

* [Ruby on Rails](https://rubyonrails.org/)
* [Sidekiq](https://sidekiq.org/)
* [Vonage API Account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=facebook-banner-generator)
* [Facebook](https://www.facebook.com)

## Installation and Usage

To install and use this application:

* Clone the repository
* Rename the `.env.sample` file to `.env`
* Fill in your Nexmo/Vonage application ID in the `.env` file
* Fill in your Facebook page ID in the `.env` file
* After creating your Nexmo/Vonage application, make sure to save the `private.key` file in the root folder of your application. **Don't commit it to GitHub.**
* Run `bundle install` and `rake db:migrate` to initialize your Rails application
* Make sure `Spring` is disabled, you can do that by adding the environment variable when starting the server as seen in the next step
* Start your Rails server with `DISABLE_SPRING=true bundle exec rails start`
* Start Sidekiq separately with `DISABLE_SPRING=true bundle exec sidekiq`
* Make sure your Rails server is externally available. ([Using ngrok](https://developer.nexmo.com/concepts/guides/testing-with-ngrok) is a great way to do that in development)
* Provide your externally available webhook status and inbound URLs (`#{YOUR_URL}/webhooks/message` and `#{YOUR_URL}/webhooks.status`) to your [Nexmo Application](https://dashboard.nexmo.com) so you can receive incoming Facebook chat messages
* Link your Nexmo Application to your Facebook Page (See [this guide](https://developer.nexmo.com/messages/concepts/facebook) on how to do that)
* Send a message to your Facebook page and the bot will direct you from there

## Contributing

We ❤️ contributions from everyone! [Bug reports](https://github.com/Nexmo-community/facebook-banner-generator/issues), [bug fixes](https://github.com/Nexmo/facebook-banner-generator/pulls) and feedback on the library is always appreciated. Look at the [Contributor Guidelines](https://github.com/Nexmo/facebook-banner-generator/blob/master/CONTRIBUTING.md) for more information and please follow the [GitHub Flow](https://guides.github.com/introduction/flow/index.html).

## License

This project is under the [MIT LICENSE](https://github.com/Nexmo/facebook-banner-generator/blob/master/LICENSE.txt).
