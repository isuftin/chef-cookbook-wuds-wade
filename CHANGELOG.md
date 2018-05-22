# CHANGELOG

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.0] - 2018-05-22
### Updated
- isuftin@usgs.gov - BREAKING CHANGE: Updated the `default['wade']['web']['ssl']['cert']['location']`
  and `default['wade']['web']['ssl']['key']['location']` attributes to be a valid URI
### Added
- isuftin@usgs.gov - SSL certificates are now copied from their original location
to /var/www/ for apache to pick up when starting httpd. This allows CentOS 7 to
work as expected
- isuftin@usgs.gov - Added the ability to add a hostname to the server configuration.
  Otherwise, uses the server's actual hostname

## [0.0.1] - 2017-05-24
### Added
- isuftin@usgs.gov - Initial creation of the WaDE Apache cookbook
