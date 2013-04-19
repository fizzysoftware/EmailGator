# EmailGator


EmailGator is a tool for sending mails by one click to all your contacts in your list.


<table>
  <tr>
    <td align="center">
      <a href="http://email.deskgator.com/assets/emailgator.png" target="_blank" title="Landing Page">
        <img src="http://email.deskgator.com/assets/emailgator.png" alt="Landing Page">
      </a>
      <br />
      <em>Landing Page</em>
    </td>
    <td align="center">
      <a href="http://email.deskgator.com/assets/compose.png" target="_blank" title="Compose">
        <img src="http://email.deskgator.com/assets/compose.png" alt="Compose">
      </a>
      <br />
      <em>Compose Message</em>
    </td>
    <td align="center">
      <a href="http://email.deskgator.com/assets/sent_item.png" target="_blank" title="Sent Items">
        <img src="http://email.deskgator.com/assets/sent_item.png" alt="Sent Items">
      </a>
      <br />
      <em>Sent Items</em>
    </td>
    <td align="center">
      <a href="http://email.deskgator.com/assets/contacts.png" target="_blank" title="Contacts">
        <img src="http://email.deskgator.com/assets/contacts.png" alt="Contacts">
      </a>
      <br />
      <em>Contacts</em>
    </td>
  </tr>
</table>

## Development Setup

### Clone the repository and make a copy to start the new application
```
git clone https://github.com/fizzysoftware/EmailGator.git
```

### Install dependencies (ensure bundler is installed)
```
cd EmailGator
bundle install
```

CREATE database config (sample config is in config/database.sample.yml)
```
cp config/database_sample.yml config/database.yml
# make the appropirate changes 

```

Setup DB
```
rake db:create
rake db:migrate
rake db:seed
```


Start the Server
```
rails s
```

For Enable Searching(Thinking Sphinx)
```
rake ts:index
rake ts:start
```

For Background Jobs(Sending mail etc)
```
rake jobs:work
```

Demo
----

There is a demo available at [http://email.deskgator.com/](http://email.deskgator.com/)


Deploying
----------

  * Change the `config/deploy.rb` accordingly.
  * Setup server and deploy

```bash
cap production deploy:setup
cap production deploy:cold
```

Copyright
---------

Copyright (c) 2012-2013 [Fizzy Software](http://www.fizzysoftware.com). See LICENSE for details.


Disclaimer
---------

This was a hackathon project which we do not maintain actively. Feel free to fork and improve :)