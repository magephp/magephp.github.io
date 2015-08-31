---
layout: docs
title: Installation
prev_section: quickstart
next_section: usage
permalink: /docs/installation/
---

Getting Magallanes installed and ready-to-go should only take a few minutes. If it
ever becomes a pain in the ass, please [file an
issue]({{ site.repository }}/issues/new) (or submit a pull request)
describing the issue you encountered and how we might make the process easier.

### Requirements

Installing Magallanes is easy and straight-forward, but there are a few requirements
you’ll need to make sure your system has before you start.

- [Shell Access](https://en.wikipedia.org/wiki/Shell_%28computing%29) - Magallanes is a command line utility, therefore you will need access to a shell/terminal environment.
- [PHP 5.3+](http://php.net/downloads.php) - Yes, it's time to grow up. Make sure that the PHP binary is on your shell path.
- Linux, Unix, or Mac OS X

<div class="note info">
  <h5>Running Magallanes on Windows</h5>
  <p>
    While Windows is not officially supported, it is possible to get it running
    on Windows. Special instructions can be found on our
    <a href="../windows/#installation">Windows-specific docs page</a>.
  </p>
</div>

## Installing Magallanes System-wide (Recommended)

The best way and simplest to install Magallanes is via
[Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29). At the terminal prompt,
simply run the following command to install Magallanes:

{% highlight bash %}
$ wget https://magephp.github.io/download/magallanes.latest.tar.gz -O magallanes.tar.gz
$ tar xfz magallanes
$ cd magallanes
$ bin/mage install --systemWide --installDir=/opt/magallanes
{% endhighlight %}

The `install` command will copy the downloaded version to the configured `--installDir`. If you want to make it available to all users, then you can perform a `--systemWide` installation, this will create a symbolic link in `/usr/bin/mage` to the installation's executable; you have to be root or super user to perform a system wide install. If you have problems
installing Magallanes, check out the [troubleshooting](../troubleshooting/) page or
[report an issue]({{ site.repository }}/issues/new) so the Magallanes
community can improve the experience for everyone.

<div class="note info">
  <h5>Compile to PHAR archive</h5>
  <p>
    If you would like to take Magallanes with you, you can also
    compile into a <code>PHAR</code> your current install, with the compile
    command, which will create a <code>mage.phar</code> file.
    In order for this to work, you must set the <code>phar.readonly</code>
    <code>php.ini</code> variable to <code>Off</code>, at least on your <code>cli</code> configuration.
{% highlight bash %}
$ mage compile
$ php mage.phar version
{% endhighlight %}
  </p>
</div>

## Installing with Composer

If you want to have all your tools defined in your project, now you can
configure composer to install Magallanes! It's quite simple, just add the
requirement line below to your project's composer.json file. Also `mage` is
declared as a vendor binary, so you can invoke Magallanes using `bin/mage`. Pretty neat, right?!

{% highlight json %}
"require-dev": {
  "magephp/magallanes": "~1.0.*"
},
"config": {
  "bin-dir": "bin"
}
{% endhighlight %}

Then we update the vendors:

{% highlight bash %}
~ $ cd my-project
~/my-project $ composer update magephp/magallanes
{% endhighlight %}

And finally we can use Magallanes from the vendor's bin:

{% highlight bash %}
~/my-project $ bin/mage version
{% endhighlight %}

## Upgrade

Just as Install, Upgrading is very, very easy! Just run the `upgrade` command and
Magallanes will auto-upgrade itself. Also with `version` you can find out the
current installed version. Check out [the upgrading page](../upgrading/) for more
information.

<!--<div class="note">
  <h5>ProTip™: Enable Syntax Highlighting</h5>
  <p>
    If you’re the kind of person who is using Jekyll, then chances are you’ll
    want to enable syntax highlighting using <a href="http://pygments.org/">Pygments</a>
    or <a href="https://github.com/jayferd/rouge">Rouge</a>. You should really
    <a href="../templates/#code-snippet-highlighting">check out how to
    do that</a> before you go any farther.
  </p>
</div>-->

Now that you’ve got everything installed, let’s get to work!
