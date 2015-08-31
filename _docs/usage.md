---
layout: docs
title: Basic Usage
prev_section: installation
next_section: structure
permalink: /docs/usage/
---

After installed `mage` executable available to you in your Terminal
window. You can use this command in a number of ways:

{% highlight bash %}
$ mage init --name="My Awesome App" --email="notify@my.app"
# => Init new project. Create new .mage in the current folder

$ mage add environment --name="env_name" --enableReleases
# => Add new <env_name> environment and enable releases

$  mage deploy to:<env_name>
# => Deploy to <env_name> environment

$ mage releases rollback --release=-1 to:<env_name>
# => Rollback to previous release of <env_name> environement,
#    You must enable releases to use this command.
{% endhighlight %}

<div class="note warning">
  <h5>Magallanes unable to execute paralles</h5>
  <p>
    While running, Magallanes itself will create a new file called
    <code>~working.lock</code> inside <code>.mage</code> folder.
    You have to wait until Magallanes finished the current job,
    before execute any new command.
  </p>
</div>

For more about the possible configuration options, see the
[configuration](../configuration/) page.