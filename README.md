# WaDE

The WaDE Chef cookbook sets up an Apache PHP server and deploys the WaDE website
onto it.

The cookbook uses an RPM for the WaDE website. The RPM is available from the CIDA
Artifactory repository located at (TODO).

Attributes:
- `default['wade']['web']['contact']` (String): The contact email address that Apache
uses. Default: `you@your.org`
- `default['wade']['web']['postgres_user']` (String): The username with which the
WaDE Apache server will use to connect to the backing Postgres database. Default: `postgres`
- `default['wade']['web']['postgres_addr']` (String): The IP or hostname that the
WaDE Apache server will use to connect to the backing Postgres database. Default: `localhost`
- `default['wade']['web']['postgres_db']` (String): The default Postgres database
that is used by the WaDE project. Default: `WADE`
- `default['wade']['web']['rpm']['url']` (String): The URL where the cookbook will
try to find the RPM from which to install the website. Default: `file:///tmp/kitchen/data/wade-web.rpm`
- `default['wade']['web']['ssl']['active']` (Boolean): Defines whether or not the
Apache web server will serve content over HTTPS. Default: `true`
- `default['wade']['web']['ssl']['cert']['location']` (String): Where the Apache
server can find the SSL certificate on the system. This attribute is only useful
when Apache will be serving content over SSL. Default: `/tmp/kitchen/data/example.com.cert`
- `default['wade']['web']['ssl']['key']['location']` (String): Where the Apache
server can find the SSL key on the system. This attribute is only useful
when Apache will be serving content over SSL. Default: `/tmp/kitchen/data/example.com.key`
- `default['wade']['databag']['databag_name']` (String): The encrypted databag name
which contains the credentials the WaDE server needs in order to connect to Postgres.
Default: `wade-_default`

#### Creating Backing Database

WaDE requires a backing Postgres database in order to function. During development
you may want to create a local Postgres instance. You can do so in a Docker container.
There is a [Docker project](https://github.com/isuftin/docker-WUDS-WaDE) which provides
that ability. Building and running the database portion of the Docker WUDS WaDE
project will satisfy the database requirement for development purposes.

#### Database Credentials

The WaDE Apache server needs to be configured with the proper connection information and credentials
to connect to the server. Most of the configuration information is documented above.
However, a password is also required in order to connect to the backing database.
This cookbook can use an encrypted databag to pull the password from. The databag
should contain an item with the id of "passwords". The item should contain a key
named "postgres_password". The value of this key/value pair will be used as the
password for the database. See [the unencrypted example](https://github.com/USGS-CIDA/chef-cookbook-wuds-wade/blob/bdd313b84eb7c4022558836398cf1cfecc29c9eb/test/integration/default/passwords.json).
