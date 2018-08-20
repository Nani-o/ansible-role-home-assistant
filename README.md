[![Build Status](https://travis-ci.org/Nani-o/ansible-role-home-assistant.svg?branch=master)](https://travis-ci.org/Nani-o/ansible-role-home-assistant)

home-assistant
--------------

This role installs [Home Assistant](https://www.home-assistant.io), an home automation bridge.

Compatibility
-------------

- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 18.04

Variables
---------

###### hass_user

The user under which homeassistant will be installed.

By default this var is set to `hass`.

```
hass_user: hass
```

###### hass_user_home

The home that will be created for the `hass_user`.

By default this var is set to `/home/{{ hass_user }}`.

```
hass_user_home: "/home/{{ hass_user }}"
```

###### hass_config_dir:

The config dir used by homeassistant. It will be used for starting the service in the systemd file and configure the automatic pulling if specified.

By default this var is set to `{{ hass_user_home }}/.homeassistant`

```
hass_config_dir: "{{ hass_user_home }}/.homeassistant"
```

###### hass_venv_dir:

The virtualenv in which homeassistant and its dependencies will be installed.

By default this var is set to `{{ hass_user_home }}/homeassistant`

```
hass_venv_dir: "{{ hass_user_home }}/homeassistant"
```

###### hass_config_secrets

If specified, this dictionnary with the contents you would like to put in your `secrets.yaml` configuration file will be deployed. The `no_log` option is specified for the templating, you should vault this variable using `ansible-vault`.

```
hass_config_secrets:
  http_password: welcome
  latitude: 0
  longitude: 0
  elevation: 0
```

###### hass_config_git_url

The git url to a repository containing the homeassistant configuration you would like to deploy. If specified this will clone the repository inside your `hass_config_dir` without erasing untracked files. This will also configure a cron job alongside a script to pull and auto restart the server on configuration change.

```
hass_config_git_url: https://github.com/Nani-o/home-assistant-config
```

License
-------

MIT

Author Information
------------------

Sofiane MEDJKOUNE
