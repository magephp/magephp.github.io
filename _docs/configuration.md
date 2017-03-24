---
layout: docs
title: Configuration
prev_section: structure
next_section: frontmatter
permalink: /docs/configuration/
---

Magallanes allows you to deploy your application in any way you can dream up, and it’s
thanks to the powerful and flexible configuration options that this is possible.

## Initiating New Project

In order to use Magallanes we have to initialize a project. This is done with the <code>init
</code> command. Similar to git this will create a <code>.mage</code> directory where all 
the configuration, environments, custom tasks, and logs are stored.

To understand about directory structure in this tool, please read [here](../structure/).

{% highlight bash %}
$ mage init --name="My fantastic app" --email="notifications@my.app" 
{% endhighlight %}

Right now the most important file is <code>.mage/config/general.yml</code>. In there is 
stored the project name and notification email, and also if notification delivery and 
logging are enabled. The log files store everything Magallanes does, all commands and 
results, so if you need to debug something that's the place to start with. The maxlogs 
indicates how many logfiles are saved, when reached the older logs are deleted. These 
are quantity of files not days.

{% highlight yaml %}
# global settings
name: My fantastic app
email: notifications@my.app
notifications: true
logging: true
maxlogs: 30

# These options are not enabled by default
composer_cmd: composer5.6-sp
# => This is composer command Magallanes going to use.
php_cmd: php5.6-sp
# => This is php command Magallanes going to use.
{% endhighlight %}

## Add An Environment

Now the fun begins. We have our project initiated so now is it's time to add an environment. 
An environment is to where we want to deploy our code and what to do with it. So an environment 
will store the configuration of to <u>where</u> to copy the application and <u>what to do</u> with it once 
deployed. Also we can configure our environment to work with releases, imagine it as a rudimentary 
versioning of our deployments.
We will talk about <code class="flag">releases</code> later.

{% highlight bash %}
$ mage add environment --name="production" --enableReleases
{% endhighlight %}

With that last command we have just created a new environment named 
<code class="flag">production</code>. This will create the configuration 
file <code>.mage/config/environments/production.yml</code>. 
We must edit that file in order to configure the environment.

{% highlight yaml %}
# production environment
deployment:
  strategy: rsync-remote-cache
  user: dummy
  from: ./
  to: /var/www/vhosts/example.com/www
  excludes:
    - app/cache/*
    - web/bundles/*
  excludes_file: .rsync_excludes
extras:
  enabled: true
  directory: shared
  vcs:
    enabled: true
    kind: git
    repository: git@github.com:example/example.git
    branch: master
    remote: origin
    directory: repo
  rsync:
    enabled: true
    from: ./
    local: .rsync_cache
    remote: cached-copy
releases:
  enabled: true
  max: 10
  symlink: current
  directory: releases
hosts:
  - 172.16.0.101
  - 172.16.0.102
  - 172.16.0.201:2222
tasks:
  pre-deploy:
    - scm/update
  on-deploy:
    - symfony2/cache-warmup: {env: prod}
  post-release:
    - purge-apc-cache
  post-deploy:
    - purge-varnish-cache
{% endhighlight %}

Also if you want to know which environments you have already configured, you 
can run the following command and it will display the existing environments.

{% highlight bash %}
$ mage list environments
{% endhighlight %}


## Configuring An Environment

Following the previous example we will edit the `.mage/config/environments/production.yml` 
file to configure the environment. Let's see the sections of the configuration file 
and what we can setup there.

### Deployment

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Setting</th>
      <th><span class="option">Options</span> and <span class="flag">Examples</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class="setting">
      <td>
        <p class="name"><strong>Deployment Strategy</strong></p>
        <p class="description">Deployment strategy Magallanes going to use to deploy.</p>
        <p class="description">List available strategies: disabled, git-rebase, git-remote-cache, rsync, rsync-remote-cache, tar-gz.</p>
      </td>
      <td class="align-center">
        <p><code class="option">strategy: NAME</code></p>
        <p><code class="flag">strategy: rsync-remote-cache</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Username</strong></p>
        <p class="description">This is the username used for SSH connections.</p>
      </td>
      <td class="align-center">
        <p><code class="option">user: USERNAME</code></p>
        <p><code class="flag">user: dummy</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Application Source</strong></p>
        <p class="description">The location of the application, usually is the same directory where Magallanes is, but it could be any other path.</p>
        <p class="description">Eg: ./something or ../hello-world or /Users/YourUser/hello</p>
      </td>
      <td class="align-center">
        <p><code class="option">from: DIR</code></p>
        <p><code class="flag">from: ./public</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Application Destination</strong></p>
        <p class="description">The remote directory where the application is gonna be copied. If you are working with releases this should not be the document root.</p>
      </td>
      <td class="align-center">
        <p><code class="option">to: DIR</code></p>
        <p><code class="flag">to: /var/www/app</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Excludes</strong></p>
        <p class="description">Exclude directories and/or files when using `rsync` or `rsync-remote-cache`. These exclusions are relative to the site's source directory and cannot be outside the source directory.</p>
        <p class="description">Magallanes always exclude `.mage` and `.git` directories.</p>
      </td>
      <td class="align-center">
      <p><code class="option">excludes: [DIR, FILE, ...]</code></p>
        <p><code class="flag">excludes: .gitignore</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Excludes File</strong></p>
        <p class="description">If you have a long list of files and directories need to be exclude. Please use this instead of `excludes`</p>
      </td>
      <td class="align-center">
      <p><code class="option">excludes_file: FILE</code></p>
        <p><code class="flag">excludes: .rsync_excludes</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note warning">
  <h5>Do not use tabs in configuration files</h5>
  <p>
    This will either lead to parsing errors, or Magallanes will revert to the
    default settings. Use spaces instead.
  </p>
</div>

### Hosts

In the hosts section we configure a list of hosts (IPs or hostnames) to where the 
rsync will run against. You can also specify a port number like in the example above. 
Also, note that you should be able to do an SSH connection to the host using 
[ssh keys without passphrase](http://bfy.tw/2qbg), so you won't be requested any password.

{% highlight yaml %}
hosts:
  - 10.10.10.10
  - connect-to-me
{% endhighlight %}

### Tasks

In the tasks section we configure which tasks to run and when. You can look a complete 
list of built-in tasks here. Each task is executed in the configured order and in a 
specific part of the deployment, these moments are these:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Setting</th>
      <th><span class="option">Options</span> and <span class="flag">Examples</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class="setting">
      <td>
        <p class="name"><strong>Pre Deploy</strong></p>
        <p class="description">Before deployments begins. Useful for vendor installation and scm update tasks.</p>
      </td>
      <td class="align-center">
        <p><code class="option">pre-deploy: TASK</code></p>
        <p><code class="flag">pre-deploy: scm/update</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>On Deploy</strong></p>
        <p class="description">Executed on each host after the code has been copied. Useful for cache warmup, symlinks creations, etc.</p>
      </td>
      <td class="align-center">
        <p><code class="option">on-deploy: TASK</code></p>
        <p><code class="flag">on-deploy: symfony2/cache-warmup: {env: prod}</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Post Release</strong></p>
        <p class="description">Executed on each host after the release has been executed.</p>
      </td>
      <td class="align-center">
        <p><code class="option">post-release: TASK</code></p>
        <p><code class="flag">post-release: purge-apc-cache</code></p>
      </td>
    </tr>
    <tr class="setting">
      <td>
        <p class="name"><strong>Post Deploy</strong></p>
        <p class="description">After the deployment is completed. Useful for general tasks like cleanup a cache system.</p>
      </td>
      <td class="align-center">
        <p><code class="option">post-deploy: TASK</code></p>
        <p><code class="flag">post-deploy: purge-varnish-cache</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

You can setup here your own tasks, bultin tasks always starts with a namespace 
of the task type it belongs (eg: scm, deployment, etc). On the other hand custom 
tasks don't have a namespace.


(to be continue...)
