---
layout: docs
title: Directory structure
prev_section: usage
next_section: configuration
permalink: /docs/structure/
---

A basic Magallanes after init usually looks something like this:

{% highlight bash %}
.mage
├── config
│   ├── environment
│   │   ├── production.yml
│   │   └── staging.yml
│   └── general.yml
├── logs
│   ├── log-20150828-050458.log
│   ├── log-20150828-051032.log
│   ├── log-20150828-051640.log
│   ├── log-20150828-053837.log
│   └── log-20150829-160601.log
├── tasks
│   ├── Permissions.php
│   ├── SetEnvDev.php
│   └── SetEnvProd.php
└── commands
    ├── HelloWorld.php
    ├── CommitMe.php
    └── CheckUpdate.php
{% endhighlight %}

An overview of what each of these does:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>File / Directory</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>.mage</code></p>
      </td>
      <td>
        <p>

          Magallanes project-specificed folder which auto-generated after <strong>init</strong>,
          this folder must be inside your project root folder.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>config</code></p>
      </td>
      <td>
        <p>

          The main <strong>general.yml</strong> configuration file is stored here.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>environment</code></p>
      </td>
      <td>
        <p>

          Stores all environment configuration files. The file name will be
          the environment name you use while deploy <code>mage deploy to:environment_name</code>.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>logs</code></p>
      </td>
      <td>
        <p>

          If logging function is enable in <strong>general.yml</strong>, all logs
          will be saved in this directory.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>tasks</code></p>
      </td>
      <td>
        <p>

          Your custom tasks need to be put here, inside this folder, to make sure
          Magallanes is able read its.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>commands</code></p>
      </td>
      <td>
        <p>

          Every custom command must be stored in this directory.
          This directory is not created by default, you need to create it manually.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>Other Files/Folders</p>
      </td>
      <td>
        <p>

          Inside <em>environment</em>, <em>logs</em> and <em>tasks</em>;
          Magallanes will auto-generate a <strong>.gitignore</strong> to execute the holy jobs.
          Sometime, in <em>.mage</em> folder, you will see <strong>~working.lock</strong>
          Don't worry about it, it is Magallanes protection.

        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
