This is a custom Wordpress theme, designed specifically for
the Ashtabula County District Library.  The design is based off of
the KopaTheme 'News Mix Lite' theme.

TASKS
* Configure Vagrant to set up our test environment
  * Install and configure a LAMP stack
  * Prepare the database for Wordpress
    * Thanks to WP-CLI, this is limited to setting up the database user; WP-CLI will create the database
  * Configure and install Wordpress
  * Map the Vagrant-provided share containing our theme
* Determine the general site layout
* Determine abstractions for the layout, e.g. classes for responsive design
* Determine the polyfills and shims necessary, such as Modernizr

Core principles
* No design astronautics; liberal use of YAGNI (You Ain't Gonna Need It)
  * While many of the KopaTheme techniques allow for flexible web-based design, they are a maintenance nightmare.
* Flat-file configurations - We will use a class wrapper with static members to hold values
  * This is subject to testing; if DB-based configs are more performant, we will use that instead.
* Sane defaults
  * All elements should have default values, such as 'alt', where reasonable
  * The design should exhibit graceful degradation
  * Do not force the use of HTTP or HTTPS (subject to change, but ONLY favoring HTTPS)
* Accessible design
  * Meet all recommendations for web accessibility, such as screen-reader support

Note that, because the pillars are included in a public GitHub repository, the included credentials
are NOT secure and should not be used in any publicly-accessible projects; please make a private fork
and configure your own credentials if you need a secure instance.  Also note that the Salt scripts
do not take any steps to harden the VM.