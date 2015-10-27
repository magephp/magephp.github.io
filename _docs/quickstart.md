---
layout: docs
title: Quick-start guide
prev_section: home
next_section: installation
permalink: /docs/quickstart/
---

For the impatient, here's how to get Magallanes up and running
globally with Composer.

{% highlight bash %}
~ $ composer global require magephp/magallanes=~1.1
~ $ mage version
~ $ cd my-project
~/my-project $ mage init --name=MyProject --email=my@email.com
~/my-project $ mage add --name=production --enableReleases
# => Now we ready to deploy!
{% endhighlight %}

Make sure you have `~/.composer/vendor/bin/` in your path.
You can now use Magallanes by using the `mage` command.

If you're running into problems, ensure you have all the [requirements
installed][Installation].

[Installation]: /docs/installation/
