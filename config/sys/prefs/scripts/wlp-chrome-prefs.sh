#!/bin/bash
echo "Writing Chrome bookmarks..."
# CHROME BOOKMARK WRITE
echo '{
   "checksum": "d673f23d985bbac93bdfbba36f4ecbae",
   "roots": {
      "bookmark_bar": {
         "children": [ {
            "date_added": "13068597790828441",
            "id": "7",
            "name": "Production Siebel",
            "type": "url",
            "url": "javascript:window.open(\"http://siebelprd1.wellpoint.com/consumer_oui\")"
         }, {
            "date_added": "13068597805116425",
            "id": "8",
            "name": "Monet Anywhere",
            "type": "url",
            "url": "https://monetanywhere.wfmlive.com/login/login.aspx"
         }, {
            "date_added": "13068597826876426",
            "id": "9",
            "name": "Anthem.com",
            "type": "url",
            "url": "https://www.anthem.com/shop"
         }, {
            "date_added": "13068597851155333",
            "id": "10",
            "name": "ADP",
            "type": "url",
            "url": "https://workforcenow.adp.com/public/index.htm"
         } ],
         "date_added": "13068597726749265",
         "date_modified": "13068658608525450",
         "id": "1",
         "name": "Bookmarks bar",
         "type": "folder"
      },
      "other": {
         "children": [  ],
         "date_added": "13068597726749274",
         "date_modified": "0",
         "id": "2",
         "name": "Other bookmarks",
         "type": "folder"
      },
      "synced": {
         "children": [  ],
         "date_added": "13068597726749275",
         "date_modified": "0",
         "id": "3",
         "name": "Mobile bookmarks",
         "type": "folder"
      }
   },
   "version": 1
}' > /home/$1/.config/google-chrome/Default/Bookmarks
echo "Write operation completed!"

echo "Writing Chrome preferences..."
# Chrome Preferences
echo '{
   "app_list": {
      "model": {
         "aapocclcgogkmnckokdopfmhonfmgoek": {
            "item_type": 1,
            "name": "Google Slides",
            "parent_id": "",
            "position": "nzs"
         },
         "aohghmighlieiainnegkcijnfilokake": {
            "item_type": 1,
            "name": "Docs",
            "parent_id": "",
            "position": "nw"
         },
         "apdfllckaahabafndbhieahigkjlhalf": {
            "item_type": 1,
            "name": "Google Drive",
            "parent_id": "",
            "position": "nyn"
         },
         "blpcfgokakmgnkcojhhkbfbldkacnbeo": {
            "item_type": 1,
            "name": "YouTube",
            "parent_id": "",
            "position": "nz"
         },
         "coobgpohoikkiipiblmjeljniedjpjpf": {
            "item_type": 1,
            "name": "Google Search",
            "parent_id": "",
            "position": "ny"
         },
         "felcaaldnbdncclmgdcncolpebgiejap": {
            "item_type": 1,
            "name": "Google Sheets",
            "parent_id": "",
            "position": "nzm"
         },
         "pjkljhegncpnkpknbcohdijeoejaedia": {
            "item_type": 1,
            "name": "Gmail",
            "parent_id": "",
            "position": "nx"
         }
      }
   },
   "bookmark_bar": {
      "show_apps_shortcut": false,
      "show_on_all_tabs": true
   },
   "browser": {
      "clear_lso_data_enabled": true,
      "last_known_google_url": "https://www.google.com/",
      "pepper_flash_settings_enabled": true,
      "window_placement": {
         "bottom": 1364,
         "left": 49,
         "maximized": false,
         "right": 1099,
         "top": 385,
         "work_area_bottom": 999,
         "work_area_left": 0,
         "work_area_right": 1280,
         "work_area_top": 0
      }
   },
   "countryid_at_install": 21843,
   "data_reduction": {
      "daily_original_length": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2582192" ],
      "daily_original_length_via_data_reduction_proxy": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_original_length_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2582192" ],
      "daily_received_length_https_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_long_bypass_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_short_bypass_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_unknown_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_via_data_reduction_proxy": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "last_update_date": "13068630000000000",
      "statistics_prefs_migrated": true
   },
   "default_apps_install_state": 3,
   "dns_prefetching": {
      "host_referral_list": [ 2, [ "http://siebelprd1.wellpoint.com/", [ "http://siebelprd1.wellpoint.com/", 3.924981199999999 ] ], [ "http://tls.web1.callproxe.com/", [ "http://tls.web1.callproxe.com/", 3.806065927999999 ] ], [ "https://accounts.google.com/", [ "https://accounts.youtube.com/", 0.9896574712356633, "https://apis.google.com/", 0.37336095113919876, "https://fonts.gstatic.com/", 1.7687010725979322, "https://oauth.googleusercontent.com/", 0.37336095113919876, "https://ssl.gstatic.com/", 3.3810373024110714 ] ], [ "https://apis.google.com/", [ "https://apis.google.com/", 2.2535753763730892, "https://fonts.gstatic.com/", 1.967674022654115 ] ], [ "https://fonts.googleapis.com/", [ "https://fonts.gstatic.com/", 4.254884852405906 ] ], [ "https://s.ytimg.com/", [ "https://s.ytimg.com/", 2.2535753763730892 ] ], [ "https://www.google.com/", [ "https://accounts.google.com/", 1.967674022654115, "https://apis.google.com/", 2.8253780838110374, "https://fonts.googleapis.com/", 1.967674022654115, "https://ssl.google-analytics.com/", 2.2535753763730892, "https://ssl.gstatic.com/", 1.967674022654115, "https://www.google.com/", 5.97029297471975, "https://www.gstatic.com/", 1.967674022654115, "https://www.youtube.com/", 1.967674022654115 ] ], [ "https://www.youtube.com/", [ "https://i.ytimg.com/", 1.967674022654115, "https://s.ytimg.com/", 2.5394767300920633, "https://www.google.com/", 1.967674022654115 ] ] ],
      "startup_list": [ 1, "http://siebelprd1.wellpoint.com/", "http://tls.web1.callproxe.com/", "https://clients1.google.com/", "https://www.google.com/" ]
   },
   "download": {
      "directory_upgrade": true
   },
   "enhanced_bookmarks_enabled": 0,
   "extensions": {
      "alerts": {
         "initialized": true
      },
      "autoupdate": {
         "next_check": "13068678185212805"
      },
      "chrome_url_overrides": {
         "bookmarks": [ "chrome-extension://eemcgdkfndhakfknompkggombfjjjeno/main.html" ]
      },
      "commands": {

      },
      "last_chrome_version": "40.0.2214.111",
      "settings": {
         "aapocclcgogkmnckokdopfmhonfmgoek": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "zs",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676951421972",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "api_console_project_id": "889782162350",
               "app": {
                  "launch": {
                     "local_path": "main.html"
                  }
               },
               "container": "GOOGLE_DRIVE",
               "current_locale": "en_US",
               "default_locale": "en_US",
               "description": "Create and edit presentations ",
               "icons": {
                  "128": "icon_128.png",
                  "16": "icon_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDLOGW2Hoztw8m2z6SmCjm7y4Oe2o6aRqO+niYKCXhZab572by7acqFIFF0On3e3a967SwNijsTx2n+7Mt3KqWzEKtnwUZqzHYSsdZZK64vWIHIduawP0EICWRMf2RGIBEdDC6I1zErtcDiSrJWeRlnb0DHWXDXlt1YseM7RiON9wIDAQAB",
               "manifest_version": 2,
               "name": "Google Slides",
               "offline_enabled": true,
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "0.9"
            },
            "page_ordinal": "n",
            "path": "aapocclcgogkmnckokdopfmhonfmgoek/0.9_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "ahfgeienlihckogmohjhadlkjgocpleb": {
            "active_permissions": {
               "api": [ "management", "system.display", "system.storage", "webstorePrivate", "system.cpu", "system.memory", "system.network" ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "t",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676943120680",
            "location": 5,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "https://chrome.google.com/webstore"
                  },
                  "urls": [ "https://chrome.google.com/webstore" ]
               },
               "description": "Discover great apps, games, extensions and themes for Google Chrome.",
               "icons": {
                  "128": "webstore_icon_128.png",
                  "16": "webstore_icon_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtl3tO0osjuzRsf6xtD2SKxPlTfuoy7AWoObysitBPvH5fE1NaAA1/2JkPWkVDhdLBWLaIBPYeXbzlHp3y4Vv/4XG+aN5qFE3z+1RU/NqkzVYHtIpVScf3DjTYtKVL66mzVGijSoAIwbFCC3LpGdaoe6Q1rSRDp76wR6jjFzsYwQIDAQAB",
               "name": "Web Store",
               "permissions": [ "webstorePrivate", "management", "system.cpu", "system.display", "system.memory", "system.network", "system.storage" ],
               "version": "0.2"
            },
            "page_ordinal": "n",
            "path": "/opt/google/chrome/resources/web_store",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "aohghmighlieiainnegkcijnfilokake": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "w",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676948202147",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "api_console_project_id": "619683526622",
               "app": {
                  "launch": {
                     "local_path": "main.html"
                  }
               },
               "container": "GOOGLE_DRIVE",
               "current_locale": "en_US",
               "default_locale": "en_US",
               "description": "Create and edit documents ",
               "icons": {
                  "128": "icon_128.png",
                  "16": "icon_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDJhLK6fk/BWTEvJhywpk7jDe4A2r0bGXGOLZW4/AdBp3IiD9o9nx4YjLAtv0tIPxi7MvFd/GUUbQBwHT5wQWONJj1z/0Rc2qBkiJA0yqXh42p0snuA8dCfdlhOLsp7/XTMEwAVasjV5hC4awl78eKfJYlZ+8fM/UldLWJ/51iBQwIDAQAB",
               "manifest_version": 2,
               "name": "Google Docs",
               "offline_enabled": true,
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "0.9"
            },
            "page_ordinal": "n",
            "path": "aohghmighlieiainnegkcijnfilokake/0.9_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "apdfllckaahabafndbhieahigkjlhalf": {
            "ack_external": true,
            "active_permissions": {
               "api": [ "background", "clipboardRead", "clipboardWrite", "notifications", "unlimitedStorage" ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "yn",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [ "background", "clipboardRead", "clipboardWrite", "notifications", "unlimitedStorage" ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676951225496",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "https://drive.google.com/?usp=chrome_app"
                  },
                  "urls": [ "http://docs.google.com/", "http://drive.google.com/", "https://docs.google.com/", "https://drive.google.com/" ]
               },
               "background": {
                  "allow_js_access": false
               },
               "current_locale": "en_US",
               "default_locale": "en_US",
               "description": "Google Drive: create, share and keep all your stuff in one place.",
               "icons": {
                  "128": "128.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIl5KlKwL2TSkntkpY3naLLz5jsN0YwjhZyObcTOK6Nda4Ie21KRqZau9lx5SHcLh7pE2/S9OiArb+na2dn7YK5EvH+aRXS1ec3uxVlBhqLdnleVgwgwlg5fH95I52IeHcoeK6pR4hW/Nv39GNlI/Uqk6O6GBCCsAxYrdxww9BiQIDAQAB",
               "manifest_version": 2,
               "name": "Google Drive",
               "offline_enabled": true,
               "options_page": "https://drive.google.com/settings",
               "permissions": [ "background", "clipboardRead", "clipboardWrite", "notifications", "unlimitedStorage" ],
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "6.4"
            },
            "page_ordinal": "n",
            "path": "apdfllckaahabafndbhieahigkjlhalf/6.4_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "bepbmhgboaologfdajaanbcjmnhjmhfn": {
            "ack_external": true,
            "active_permissions": {
               "api": [ "audioCapture", "hotwordPrivate", "management", "power", "tabs", "webConnectable" ],
               "explicit_host": [ "*://*.google.co.uk/*", "*://*.google.com/*", "*://*.google.de/*", "*://*.google.fr/*", "*://*.google.ru/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "disable_reasons": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068677465141900",
            "lastpingday": "13068633600636626",
            "location": 10,
            "manifest": {
               "background": {
                  "page": "background.html"
               },
               "description": "This extension allows you to say ‘Ok Google’ and start speaking your search.",
               "externally_connectable": {
                  "ids": [ "dnhpdliibojhegemfjheidglijccjfmc" ],
                  "matches": [ "*://*.google.com/*", "*://*.google.ru/*", "*://*.google.co.uk/*", "*://*.google.fr/*", "*://*.google.de/*", "chrome://newtab/" ]
               },
               "icons": {
                  "128": "images/icon-128.png",
                  "16": "images/icon-16.png",
                  "48": "images/icon-48.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCXIZX6oiu1YU4WTZBC5FCFw08u8fPtm75p6l9IzYaCCOjJh47sg1M5eatyBuVVvC2ahku3PzgquBZQZcRkr6kd9sa8jHUBeTQsvPv8yFicYlAqdguFtEK2kbXN2Ff5i61kIe79I6hZKlTJ6KsxiAcOPQpV1uIgJFyrFxTyC1u+WwIDAQAB",
               "manifest_version": 2,
               "minimum_chrome_version": "31",
               "name": "Google Voice Search Hotword (Beta)",
               "options_page": "options.html",
               "permissions": [ "*://*.google.com/*", "*://*.google.ru/*", "*://*.google.co.uk/*", "*://*.google.fr/*", "*://*.google.de/*", "audioCapture", "hotwordPrivate", "management", "power", "tabs" ],
               "platforms": [ {
                  "lang": "de",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_de/"
               }, {
                  "lang": "de",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_de/"
               }, {
                  "lang": "de",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_de/"
               }, {
                  "lang": "en-GB",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_en-gb/"
               }, {
                  "lang": "en-GB",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_en-gb/"
               }, {
                  "lang": "en-GB",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_en-gb/"
               }, {
                  "lang": "fr",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_fr/"
               }, {
                  "lang": "fr",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_fr/"
               }, {
                  "lang": "fr",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_fr/"
               }, {
                  "lang": "ru",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_ru/"
               }, {
                  "lang": "ru",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_ru/"
               }, {
                  "lang": "ru",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_ru/"
               }, {
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_/"
               }, {
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_/"
               }, {
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_/"
               } ],
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "0.1.1.5023",
               "web_accessible_resources": [ "audio/1_short_Open_16_16.wav" ]
            },
            "path": "bepbmhgboaologfdajaanbcjmnhjmhfn/0.1.1.5023_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 0,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "blpcfgokakmgnkcojhhkbfbldkacnbeo": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "z",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 153,
            "events": [  ],
            "from_bookmark": true,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676948367001",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "app": {
                  "launch": {
                     "container": "tab",
                     "web_url": "http://www.youtube.com/?feature=ytca"
                  },
                  "web_content": {
                     "enabled": true,
                     "origin": "http://www.youtube.com"
                  }
               },
               "current_locale": "en_US",
               "default_locale": "en",
               "description": "The world''s'' most popular online video community.",
               "icons": {
                  "128": "128.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDC/HotmFlyuz5FaHaIbVBhhL4BwbcUtsfWwzgUMpZt5ZsLB2nW/Y5xwNkkPANYGdVsJkT2GPpRRIKBO5QiJ7jPMa3EZtcZHpkygBlQLSjMhdrAKevpKgIl6YTkwzNvExY6rzVDzeE9zqnIs33eppY4S5QcoALMxuSWlMKqgFQjHQIDAQAB",
               "manifest_version": 2,
               "name": "YouTube",
               "update_url": "http://clients2.google.com/service/update2/crx",
               "version": "4.2.7"
            },
            "page_ordinal": "n",
            "path": "blpcfgokakmgnkcojhhkbfbldkacnbeo/4.2.7_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "coobgpohoikkiipiblmjeljniedjpjpf": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "y",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 153,
            "events": [  ],
            "from_bookmark": true,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676948463291",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "http://www.google.com/webhp?source=search_app"
                  },
                  "urls": [ "*://www.google.com/search", "*://www.google.com/webhp", "*://www.google.com/imgres" ]
               },
               "current_locale": "en_US",
               "default_locale": "en",
               "description": "The fastest way to search the web.",
               "icons": {
                  "128": "128.png",
                  "16": "16.png",
                  "32": "32.png",
                  "48": "48.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIiso3Loy5VJHL40shGhUl6it5ZG55XB9q/2EX6aa88jAxwPutbCgy5d9bm1YmBzLfSgpX4xcpgTU08ydWbd7b50fbkLsqWl1mRhxoqnN01kuNfv9Hbz9dWWYd+O4ZfD3L2XZs0wQqo0y6k64n+qeLkUMd1MIhf6MR8Xz1SOA8pwIDAQAB",
               "manifest_version": 2,
               "name": "Google Search",
               "permissions": [  ],
               "update_url": "http://clients2.google.com/service/update2/crx",
               "version": "0.0.0.20"
            },
            "page_ordinal": "n",
            "path": "coobgpohoikkiipiblmjeljniedjpjpf/0.0.0.20_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "dnhpdliibojhegemfjheidglijccjfmc": {
            "active_permissions": {
               "api": [ "hotwordPrivate", "tabs", "webConnectable" ],
               "explicit_host": [ "*://*.google.co.uk/*", "*://*.google.com/*", "*://*.google.de/*", "*://*.google.fr/*", "*://*.google.ru/*", "chrome://newtab/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068677464255026",
            "location": 5,
            "manifest": {
               "background": {
                  "persistent": false,
                  "scripts": [ "manager.js" ]
               },
               "externally_connectable": {
                  "ids": [ "cpfhkdbjfdgdebcjlifoldbijinjfifp" ],
                  "matches": [ "*://*.google.com/*", "*://*.google.ru/*", "*://*.google.co.uk/*", "*://*.google.fr/*", "*://*.google.de/*", "chrome://newtab/" ]
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDagiQy1VGkO2CHJSjVh7eU5GtuBuOlg2/cTZt7203AcevqpcDd+65S2/yd9KAELYcU6pK8nHVGYBMI6s0u+0RgXfIJ0eFOlTlgfAQWHvg8ovHtJlFJd1COrOkbntD9+s9Jobr3ldmow87aZF1bVHUY4khVP56cZe6adlVw2wK31QIDAQAB",
               "manifest_version": 2,
               "minimum_chrome_version": "32",
               "name": "hotword helper",
               "permissions": [ "*://*.google.com/*", "*://*.google.ru/*", "*://*.google.co.uk/*", "*://*.google.fr/*", "*://*.google.de/*", "chrome://newtab/", "hotwordPrivate", "tabs" ],
               "version": "0.0.2.0"
            },
            "path": "/opt/google/chrome/resources/hotword_helper",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "eemcgdkfndhakfknompkggombfjjjeno": {
            "active_permissions": {
               "api": [ "bookmarks", "bookmarkManagerPrivate", "metricsPrivate", "systemPrivate", "tabs" ],
               "explicit_host": [ "chrome://favicon/*", "chrome://resources/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943118920",
            "location": 5,
            "manifest": {
               "chrome_url_overrides": {
                  "bookmarks": "main.html"
               },
               "content_security_policy": "object-src 'none'; script-src chrome://resources 'self'",
               "description": "Bookmark Manager",
               "icons": {

               },
               "incognito": "split",
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDQcByy+eN9jzazWF/DPn7NW47sW7lgmpk6eKc0BQM18q8hvEM3zNm2n7HkJv/R6fU+X5mtqkDuKvq5skF6qqUF4oEyaleWDFhd1xFwV7JV+/DU7bZ00w2+6gzqsabkerFpoP33ZRIw7OviJenP0c0uWqDWF8EGSyMhB3txqhOtiQIDAQAB",
               "manifest_version": 2,
               "name": "Bookmark Manager",
               "permissions": [ "bookmarks", "bookmarkManagerPrivate", "metricsPrivate", "systemPrivate", "tabs", "chrome://favicon/", "chrome://resources/" ],
               "version": "0.1"
            },
            "path": "/opt/google/chrome/resources/bookmark_manager",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "ennkphjdgehloodpbhlhldgbnhmacadg": {
            "active_permissions": {
               "api": [  ],
               "explicit_host": [ "chrome://settings-frame/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [ "app.runtime.onLaunched" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943123527",
            "location": 5,
            "manifest": {
               "app": {
                  "background": {
                     "scripts": [ "settings_app.js" ]
                  }
               },
               "description": "Settings",
               "display_in_launcher": false,
               "icons": {
                  "128": "settings_app_icon_128.png",
                  "16": "settings_app_icon_16.png",
                  "32": "settings_app_icon_32.png",
                  "48": "settings_app_icon_48.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDoVDPGX6fvKPVVgc+gnkYlGqHuuapgFDyKhsy4z7UzRLO/95zXPv8h8e5EacqbAQJLUbP6DERH5jowyNEYVxq9GJyntJMwP1ejvoz/52hnY3CCGGCmttmKzzpp5zwLuq3iZf8bslwywfflNUYtaCFSDa0TtrBZz0aOPrAAd/AhNwIDAQAB",
               "manifest_version": 2,
               "name": "Settings",
               "permissions": [ "chrome://settings-frame/" ],
               "version": "0.2"
            },
            "path": "/opt/google/chrome/resources/settings_app",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "running": false,
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "felcaaldnbdncclmgdcncolpebgiejap": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "zm",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676950728278",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "api_console_project_id": "1083656409722",
               "app": {
                  "launch": {
                     "local_path": "main.html"
                  }
               },
               "container": "GOOGLE_DRIVE",
               "current_locale": "en_US",
               "default_locale": "en_US",
               "description": "Create and edit spreadsheets",
               "icons": {
                  "128": "icon_128.png",
                  "16": "icon_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC0AHrkP4MHPDKQI/O9LqZjtM24hKApaT3uVHeOduC06ZXWuwVRvx2wy5JUmMHfefXRG26tErgZSWpbxkm+2xfplKnT+grXF771HDgsNrNXERJHq7tnoYsWRiG3Gbs5BI4Ei+naZ/nyiWblbT4GyuD9N5yXNtoM0AnK+0FYhbO7IwIDAQAB",
               "manifest_version": 2,
               "name": "Google Sheets",
               "offline_enabled": true,
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "1.1"
            },
            "page_ordinal": "n",
            "path": "felcaaldnbdncclmgdcncolpebgiejap/1.1_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "gfdkimpbcpahaombhbimeihdjnejgicl": {
            "active_permissions": {
               "api": [ "feedbackPrivate" ],
               "explicit_host": [ "chrome://resources/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [ "feedbackPrivate.onFeedbackRequested" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943122806",
            "location": 5,
            "manifest": {
               "app": {
                  "background": {
                     "scripts": [ "js/event_handler.js" ]
                  },
                  "content_security_policy": "default-src 'none'; script-src 'self' chrome://resources; style-src 'unsafe-inline' *; img-src *; media-src 'self'"
               },
               "description": "User feedback extension",
               "display_in_launcher": false,
               "display_in_new_tab_page": false,
               "icons": {
                  "32": "images/icon32.png",
                  "64": "images/icon64.png"
               },
               "incognito": "split",
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDMZElzFX2J1g1nRQ/8S3rg/1CjFyDltWOxQg+9M8aVgNVxbutEWFQz+oQzIP9BB67mJifULgiv12ToFKsae4NpEUR8sPZjiKDIHumc6pUdixOm8SJ5Rs16SMR6+VYxFUjlVW+5CA3IILptmNBxgpfyqoK0qRpBDIhGk1KDEZ4zqQIDAQAB",
               "manifest_version": 2,
               "name": "Feedback",
               "permissions": [ "feedbackPrivate", "chrome://resources/" ],
               "version": "1.0"
            },
            "path": "/opt/google/chrome/resources/feedback",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "running": false,
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "kmendfapggjehodndflmmgagdbamhnfd": {
            "active_permissions": {
               "api": [ "hid", "u2fDevices", "usb", {
                  "usbDevices": [ {
                     "interfaceId": -1,
                     "productId": 529,
                     "vendorId": 4176
                  } ]
               }, "webConnectable" ],
               "explicit_host": [ "https://www.gstatic.com/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943124995",
            "location": 5,
            "manifest": {
               "background": {
                  "persistent": false,
                  "scripts": [ "util.js", "b64.js", "sha256.js", "countdown.js", "countdowntimer.js", "devicestatuscodes.js", "approvedorigins.js", "errorcodes.js", "gnubbycodetypes.js", "webrequest.js", "gnubbymsgtypes.js", "messagetypes.js", "factoryregistry.js", "closeable.js", "requesthelper.js", "webrequestsender.js", "enroller.js", "requestqueue.js", "signer.js", "origincheck.js", "textfetcher.js", "appid.js", "watchdog.js", "gstaticorigincheck.js", "googleapprovedorigins.js", "gnubbydevice.js", "hidgnubbydevice.js", "usbgnubbydevice.js", "gnubbies.js", "gnubby.js", "gnubby-u2f.js", "gnubbyfactory.js", "singlesigner.js", "multiplesigner.js", "generichelper.js", "inherits.js", "individualattest.js", "devicefactoryregistry.js", "usbhelper.js", "usbenrollhandler.js", "usbsignhandler.js", "usbgnubbyfactory.js", "googlecorpindividualattest.js", "cryptotokenbackground.js" ]
               },
               "description": "CryptoToken Component Extension",
               "externally_connectable": {
                  "accepts_tls_channel_id": true,
                  "ids": [ "fjajfjhkeibgmiggdfehjplbhmfkialk" ],
                  "matches": [ "https://login.corp.google.com/*", "https://accounts.google.com/*", "https://myaccount.google.com/*", "https://security.google.com/*" ]
               },
               "incognito": "split",
               "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq7zRobvA+AVlvNqkHSSVhh1sEWsHSqz4oR/XptkDe/Cz3+gW9ZGumZ20NCHjaac8j1iiesdigp8B1LJsd/2WWv2Dbnto4f8GrQ5MVphKyQ9WJHwejEHN2K4vzrTcwaXqv5BSTXwxlxS/mXCmXskTfryKTLuYrcHEWK8fCHb+0gvr8b/kvsi75A1aMmb6nUnFJvETmCkOCPNX5CHTdy634Ts/x0fLhRuPlahk63rdf7agxQv5viVjQFk+tbgv6aa9kdSd11Js/RZ9yZjrFgHOBWgP4jTBqud4+HUglrzu8qynFipyNRLCZsaxhm+NItTyNgesxLdxZcwOz56KD1Q4IQIDAQAB",
               "manifest_version": 2,
               "name": "CryptoTokenExtension",
               "permissions": [ "hid", "usb", "u2fDevices", "https://www.gstatic.com/", {
                  "usbDevices": [ {
                     "productId": 529,
                     "vendorId": 4176
                  } ]
               } ],
               "version": "0.9.6"
            },
            "path": "/opt/google/chrome/resources/cryptotoken",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "mfehgcgbbipciphmccgaenjidiccnmng": {
            "active_permissions": {
               "api": [ "cloudPrintPrivate" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676943119987",
            "location": 5,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "https://www.google.com/cloudprint"
                  },
                  "urls": [ "https://www.google.com/cloudprint/enable_chrome_connector" ]
               },
               "description": "Cloud Print",
               "display_in_launcher": false,
               "icons": {

               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDqOhnwk4+HXVfGyaNsAQdU/js1Na56diW08oF1MhZiwzSnJsEaeuMN9od9q9N4ZdK3o1xXOSARrYdE+syV7Dl31nf6qz3A6K+D5NHe6sSB9yvYlIiN37jdWdrfxxE0pRYEVYZNTe3bzq3NkcYJlOdt1UPcpJB+isXpAGUKUvt7EQIDAQAB",
               "name": "Cloud Print",
               "permissions": [ "cloudPrintPrivate" ],
               "version": "0.1"
            },
            "path": "/opt/google/chrome/resources/cloud_print",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "mfffpogegjflfpflabcdkioaeobkgjik": {
            "active_permissions": {
               "api": [ "webRequest", "webRequestBlocking" ],
               "explicit_host": [ "\u003Call_urls>", "chrome://favicon/*" ],
               "manifest_permissions": [  ],
               "scriptable_host": [ "\u003Call_urls>" ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676950416875",
            "location": 5,
            "manifest": {
               "background": {
                  "scripts": [ "background.js", "channel.js" ]
               },
               "content_scripts": [ {
                  "all_frames": true,
                  "js": [ "channel.js", "saml_injected.js" ],
                  "matches": [ "\u003Call_urls>" ],
                  "run_at": "document_start"
               } ],
               "content_security_policy": "default-src 'self'; script-src 'self'; frame-src *; style-src 'self' 'unsafe-inline'",
               "description": "GAIA Component Extension",
               "key": "MIGdMA0GCSqGSIb3DQEBAQUAA4GLADCBhwKBgQC4L17nAfeTd6Xhtx96WhQ6DSr8KdHeQmfzgCkieKLCgUkWdwB9G1DCuh0EPMDn1MdtSwUAT7xE36APEzi0X/UpKjOVyX8tCC3aQcLoRAE0aJAvCcGwK7qIaQaczHmHKvPC2lrRdzSoMMTC5esvHX+ZqIBMi123FOL0dGW6OPKzIwIBIw==",
               "manifest_version": 2,
               "name": "GaiaAuthExtension",
               "permissions": [ "\u003Call_urls>", "webRequest", "webRequestBlocking" ],
               "version": "0.0.1",
               "web_accessible_resources": [ "main.css", "main.html", "main.js", "offline.css", "offline.html", "offline.js", "success.html", "success.js", "util.js" ]
            },
            "path": "/opt/google/chrome/resources/gaia_auth",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "mgndgikekgjfcpckkfioiadnlibdjbkf": {
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "n",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676943121383",
            "location": 5,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "http://THIS-WILL-BE-REPLACED"
                  }
               },
               "description": "A fast, simple, and secure web browser, built for the modern web.",
               "display_in_launcher": true,
               "display_in_new_tab_page": false,
               "icons": {
                  "128": "product_logo_128.png",
                  "16": "product_logo_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDNuYLEQ1QPMcc5HfWI/9jiEf6FdJWqEtgRmIeI7qtjPLBM5oje+Ny2E2mTAhou5qdJiO2CHWdU1DQXY2F7Zu2gZaKZgHLfK4WimHxUT5Xd9/aro/R9PCzjguM1BLusiWYc9xlj1IsZpyiN1hcjU7SCnBhv1feQlv2WSB5KRiXwhQIDAQAB",
               "name": "Chrome",
               "version": "0.1"
            },
            "page_ordinal": "n",
            "path": "/opt/google/chrome/resources/chrome_app",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "neajdppkdcdipfabeoofebfddakdcjhd": {
            "active_permissions": {
               "api": [ "systemPrivate", "ttsEngine" ],
               "explicit_host": [ "https://www.google.com/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [ "ttsEngine.onPause", "ttsEngine.onResume", "ttsEngine.onSpeak", "ttsEngine.onStop" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943124246",
            "location": 5,
            "manifest": {
               "background": {
                  "persistent": false,
                  "scripts": [ "tts_extension.js" ]
               },
               "description": "Component extension providing speech via the Google network text-to-speech service.",
               "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA8GSbNUMGygqQTNDMFGIjZNcwXsHLzkNkHjWbuY37PbNdSDZ4VqlVjzbWqODSe+MjELdv5Keb51IdytnoGYXBMyqKmWpUrg+RnKvQ5ibWr4MW9pyIceOIdp9GrzC1WZGgTmZismYR3AjaIpufZ7xDdQQv+XrghPWCkdVqLN+qZDA1HU+DURznkMICiDDSH2sU0egm9UbWfS218bZqzKeQDiC3OnTPlaxcbJtKUuupIm5knjze3Wo9Ae9poTDMzKgchg0VlFCv3uqox+wlD8sjXBoyBCCK9HpImdVAF1a7jpdgiUHpPeV/26oYzM9/grltwNR3bzECQgSpyXp0eyoegwIDAQAB",
               "manifest_version": 2,
               "name": "Google Network Speech",
               "permissions": [ "systemPrivate", "ttsEngine", "https://www.google.com/" ],
               "tts_engine": {
                  "voices": [ {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "en-US",
                     "remote": true,
                     "voice_name": "Google US English"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "male",
                     "lang": "en-GB",
                     "remote": true,
                     "voice_name": "Google UK English Male"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "en-GB",
                     "remote": true,
                     "voice_name": "Google UK English Female"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "es-ES",
                     "remote": true,
                     "voice_name": "Google Español"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "fr-FR",
                     "remote": true,
                     "voice_name": "Google Français"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "it-IT",
                     "remote": true,
                     "voice_name": "Google Italiano"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "de-DE",
                     "remote": true,
                     "voice_name": "Google Deutsch"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "ja-JP",
                     "remote": true,
                     "voice_name": "Google 日本人"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "ko-KR",
                     "remote": true,
                     "voice_name": "Google 한국의"
                  }, {
                     "event_types": [ "start", "end", "error" ],
                     "gender": "female",
                     "lang": "zh-CN",
                     "remote": true,
                     "voice_name": "Google 中国的"
                  } ]
               },
               "version": "1.0"
            },
            "path": "/opt/google/chrome/resources/network_speech_synthesis",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "nkeimhogjdpnpccoofpliimaahmaaome": {
            "active_permissions": {
               "api": [ "alarms", "desktopCapture", "processes", "webConnectable", "webrtcAudioPrivate", "webrtcLoggingPrivate", "system.cpu" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676943122084",
            "location": 5,
            "manifest": {
               "background": {
                  "page": "background.html",
                  "persistent": false
               },
               "externally_connectable": {
                  "matches": [ "https://*.google.com/hangouts*", "*://localhost/*" ]
               },
               "incognito": "split",
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAQt2ZDdPfoSe/JI6ID5bgLHRCnCu9T36aYczmhw/tnv6QZB2I6WnOCMZXJZlRdqWc7w9jo4BWhYS50Vb4weMfh/I0On7VcRwJUgfAxW2cHB+EkmtI1v4v/OU24OqIa1Nmv9uRVeX0GjhQukdLNhAE6ACWooaf5kqKlCeK+1GOkQIDAQAB",
               "manifest_version": 2,
               "name": "Google+ Hangouts",
               "permissions": [ "alarms", "desktopCapture", "processes", "system.cpu", "webrtcAudioPrivate", "webrtcLoggingPrivate" ],
               "version": "1.0"
            },
            "path": "/opt/google/chrome/resources/hangout_services",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         },
         "nmmhkkegccagdldgiimedpiccmgmieda": {
            "ack_external": true,
            "active_permissions": {
               "api": [ "identity", "webview" ],
               "explicit_host": [ "https://checkout.google.com/*", "https://sandbox.google.com/*", "https://www.google.com/*", "https://www.googleapis.com/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [ "app.runtime.onLaunched" ],
            "from_bookmark": false,
            "from_webstore": true,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13068676948092859",
            "lastpingday": "13068633601115612",
            "location": 10,
            "manifest": {
               "app": {
                  "background": {
                     "scripts": [ "craw_background.js" ]
                  }
               },
               "current_locale": "en_US",
               "default_locale": "en",
               "description": "Google Wallet for digital goods",
               "display_in_launcher": false,
               "display_in_new_tab_page": false,
               "icons": {
                  "128": "images/icon_128.png",
                  "16": "images/icon_16.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrKfMnLqViEyokd1wk57FxJtW2XXpGXzIHBzv9vQI/01UsuP0IV5/lj0wx7zJ/xcibUgDeIxobvv9XD+zO1MdjMWuqJFcKuSS4Suqkje6u+pMrTSGOSHq1bmBVh0kpToN8YoJs/P/yrRd7FEtAXTaFTGxQL4C385MeXSjaQfiRiQIDAQAB",
               "manifest_version": 2,
               "minimum_chrome_version": "29",
               "name": "Google Wallet",
               "oauth2": {
                  "auto_approve": true,
                  "client_id": "203784468217.apps.googleusercontent.com",
                  "scopes": [ "https://www.googleapis.com/auth/sierra", "https://www.googleapis.com/auth/sierrasandbox", "https://www.googleapis.com/auth/chromewebstore", "https://www.googleapis.com/auth/chromewebstore.readonly" ]
               },
               "permissions": [ "identity", "webview", "https://checkout.google.com/", "https://sandbox.google.com/checkout/", "https://www.google.com/", "https://www.googleapis.com/*" ],
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "0.0.6.1"
            },
            "path": "nmmhkkegccagdldgiimedpiccmgmieda/0.0.6.1_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "running": false,
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "pjkljhegncpnkpknbcohdijeoejaedia": {
            "ack_external": true,
            "active_permissions": {
               "api": [ "notifications" ],
               "manifest_permissions": [  ]
            },
            "app_launcher_ordinal": "x",
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [ "notifications" ],
               "manifest_permissions": [  ]
            },
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13068676947034247",
            "lastpingday": "13068633601115612",
            "location": 1,
            "manifest": {
               "app": {
                  "launch": {
                     "container": "tab",
                     "web_url": "https://mail.google.com/mail/ca"
                  },
                  "urls": [ "*://mail.google.com/mail/ca" ]
               },
               "current_locale": "en_US",
               "default_locale": "en",
               "description": "Fast, searchable email with less spam.",
               "icons": {
                  "128": "128.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCuGglK43iAz3J9BEYK/Mz6ZhloIMMDqQSAaf3vJt4eHbTbSDsu4WdQ9dQDRcKlg8nwQdePBt0C3PSUBtiSNSS37Z3qEGfS7LCju3h6pI1Yr9MQtxw+jUa7kXXIS09VV73pEFUT/F7c6Qe8L5ZxgAcBvXBh1Fie63qb02I9XQ/CQIDAQAB",
               "name": "Gmail",
               "options_page": "https://mail.google.com/mail/ca/#settings",
               "permissions": [ "notifications" ],
               "update_url": "http://clients2.google.com/service/update2/crx",
               "version": "7"
            },
            "page_ordinal": "n",
            "path": "pjkljhegncpnkpknbcohdijeoejaedia/7_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         }
      }
   },
   "hotword": {
      "previous_language": "en-US"
   },
   "http_original_content_length": "2582192",
   "http_received_content_length": "2582192",
   "intl": {
      "accept_languages": "en-US,en"
   },
   "invalidator": {
      "client_id": "Va3F98JPbcQoIkgAjn/A0w=="
   },
   "media": {
      "device_id_salt": "vsIU+/BT9ezaEKxwAt0+3Q=="
   },
   "net": {
      "http_server_properties": {
         "servers": {
            "accounts.google.com:443": {
               "alternate_protocol": {
                  "port": 443,
                  "probability": 0.08,
                  "protocol_str": "quic"
               },
               "settings": {
                  "4": 100
               },
               "supports_spdy": true
            },
            "accounts.youtube.com:443": {
               "settings": {
                  "4": 100
               },
               "supports_spdy": true
            },
            "cache.pack.google.com:80": {
               "alternate_protocol": {
                  "port": 80,
                  "probability": 0.08,
                  "protocol_str": "quic"
               }
            },
            "clients1.google.com:443": {
               "settings": {
                  "4": 100
               },
               "supports_spdy": true
            },
            "r2---sn-uigxxnpmut-qxoe.c.pack.google.com:80": {
               "alternate_protocol": {
                  "port": 80,
                  "probability": 0.01,
                  "protocol_str": "quic"
               }
            },
            "www.google.com:443": {
               "settings": {
                  "4": 100
               },
               "supports_spdy": true
            }
         },
         "version": 3
      }
   },
   "pinned_tabs": [  ],
   "plugins": {
      "plugins_list": [  ],
      "removed_old_component_pepper_flash_settings": true
   },
   "profile": {
      "avatar_index": 26,
      "content_settings": {
         "pattern_pairs": {

         },
         "pref_version": 1
      },
      "created_by_version": "40.0.2214.111",
      "exit_type": "Normal",
      "exited_cleanly": true,
      "local_profile_id": 7649618,
      "managed_user_id": "",
      "name": "First user",
      "per_host_zoom_levels": {

      }
   },
   "protection": {
      "macs": {
         "browser": {
            "show_home_button": "9DDE23BD288B95F7CE675BBD01A9E2B63A7624B8C3CDB431097FDF3F63AB4E51"
         },
         "default_search_provider": {
            "keyword": "644465DA4C1837B311E9CB3D01799980CD457416EBDE4CAA1A7EF1E4D367012D",
            "name": "99B0B64F5F6258C0ACCF4304A81F226E8724B9F20A8CCCEEACDFEFAAA73400F9",
            "search_url": "3C25105F537950F7F6DEC99E79CB128A29D165D7F12968C360E3BB5D0D627FC3"
         },
         "default_search_provider_data": {
            "template_url_data": "705F2D2FDD2FF483A1A9E675DFD71CCB223E81A2CEBF5D20C031A68B0020CF77"
         },
         "extensions": {
            "settings": {
               "aapocclcgogkmnckokdopfmhonfmgoek": "B141414B4D617704C17F2AFD19A6A62134C3341B2E334992960FB7F36DEAF289",
               "ahfgeienlihckogmohjhadlkjgocpleb": "04EA9C24AFEEDA2ED0086EADDD7210E7204394AFF5E7116CE79463499D012C67",
               "aohghmighlieiainnegkcijnfilokake": "69F9EA29DC86FCA0EDA076471C9C5C3517D071EDA03381E1717A9987ED3B9D6F",
               "apdfllckaahabafndbhieahigkjlhalf": "900A3212E680930CB8FA46601EBA4C66250723A5C9974C3B79C2F3BEC1BEAE0A",
               "bepbmhgboaologfdajaanbcjmnhjmhfn": "DF4994D5E8A0B5DBF43E4A9ABA5EA8EB7A5F089C49B78FD71E0E47DF232FF470",
               "blpcfgokakmgnkcojhhkbfbldkacnbeo": "03511DEC0570AAA79615E918DE65F2C896205354FF2C7996AB239B9101E5D609",
               "coobgpohoikkiipiblmjeljniedjpjpf": "646B25D67D9820ECDB10D68819869B72EC85964E6DFB74063EA276354F05B6BB",
               "dnhpdliibojhegemfjheidglijccjfmc": "5F20A8F44E22A7CEAE9C2BA09D346E00AFF352DB8E3F7E9F59B30704A600C05A",
               "eemcgdkfndhakfknompkggombfjjjeno": "3E68159F438BCAA3528F87B01BC7F1F27FD6774FE6349E0762EA362A703BDE5B",
               "ennkphjdgehloodpbhlhldgbnhmacadg": "35CAEA9A17AA683CF3F22B4ECA39676E93F65C31F017B6DEF3F24FFBD5524CE4",
               "felcaaldnbdncclmgdcncolpebgiejap": "3E7879C6259A8C73CE1156022A695F7D9753A16E1ABBF391E9298AFC77914FAD",
               "gfdkimpbcpahaombhbimeihdjnejgicl": "52E60D5698A5B64456B16E745ED22FBDA5428D066E8DD098FA998435E70FB4C1",
               "kmendfapggjehodndflmmgagdbamhnfd": "AAAC09360246769C97AA5AC4D51647E803E282F32E43753763523675511DBB9F",
               "mfehgcgbbipciphmccgaenjidiccnmng": "D42FB179D8069F57ACB1B0200E7F0E6C85A4331F04D5AEAC90D19A1C376F1D90",
               "mfffpogegjflfpflabcdkioaeobkgjik": "1A5909ACBF37893D1CD1946D32C60F155C4010D20B3E6C1A404135A95785F3CD",
               "mgndgikekgjfcpckkfioiadnlibdjbkf": "036DDD6EA6647E12FF0BC074003B9E0E5B35C153967D8107CDA95DA14C816CF7",
               "neajdppkdcdipfabeoofebfddakdcjhd": "759BB53A1000690B8A7E742AF69089596A2DAD2BA3F629B2DE8ECA33E083A99C",
               "nkeimhogjdpnpccoofpliimaahmaaome": "FBA899058B4581E2838A40DB9B5D3E70DED9A7ECE6510DD0409968D4517999D7",
               "nmmhkkegccagdldgiimedpiccmgmieda": "14FF5FF7FE16D5BD4A9785F70A156FA41FCA190F889C818CCD166EC7BC83F315",
               "pjkljhegncpnkpknbcohdijeoejaedia": "51C85DB0F5298D5628C2DC93BF7FE2DD97BB16575FBA53E3E899089E774882CD"
            }
         },
         "google": {
            "services": {
               "last_username": "C202CF3B01A560B8B7D71D3B0076B61126EF72F4B11D79B3EA6E3661DB757E93",
               "username": "1CA30EB4EEE885888D93E71C93383D2E2A14715338EDF9B157FF935504B57767"
            }
         },
         "homepage": "B2A199504AEACAAD5C3A7BB4A96D9C3A9536D7A29672EB4DA3B9552B8D39C49C",
         "homepage_is_newtabpage": "306C67E79E036278678ED45B3C668C4421665A206FC4B97F053015981C8BAAE2",
         "pinned_tabs": "14F8B2B035A86C0AEA5637DFD2AA7F5BDEADD0AAFF13141260E56C9477047715",
         "prefs": {
            "preference_reset_time": "7B22235E8A603BE387D81441C8C88F0C4E591567147FA05BE235C96189AC4490"
         },
         "profile": {
            "reset_prompt_memento": "2A87A41FA6C5BB2B079551D327A137990410865CF3E4D2E701C2007E85192385"
         },
         "safebrowsing": {
            "incident_report_sent": "10CA58C8620643C58C61B84A630055D8CCEB7D8BD5AC7E8138E0A0FB5C6978D3",
            "incidents_sent": "F1827D0C55798CE7843DAF5DDEAB06A9BB2F9628970A5DCDA2543102436E4749"
         },
         "search_provider_overrides": "99AC1EA12DA6196886F08A934B3B5006A725063DF41E9D0EE38F1FCFFDFDD5B0",
         "session": {
            "restore_on_startup": "7BADFD2212B8A15263FDE51964FD3BAA8E29BF70E76A05BFC8C68CFFEE5706AA",
            "startup_urls": "B9373BFF0F926AE6653FF6840F391B8B02A682682D0CBBAA79D52A6A8DA09494"
         },
         "sync": {
            "remaining_rollback_tries": "C5BA99F3AF8531F0B21BED59CABAED66DCF7D7A298AFA1BD4D59BF414F8F09BA"
         }
      }
   },
   "proxy": {

   },
   "session": {
      "restore_on_startup": 4,
      "restore_on_startup_migrated": true,
      "startup_urls": [ "http://tls.web1.callproxe.com/cti/agents/" ],
      "startup_urls_migration_time": "13068676942857973"
   },
   "sync_promo": {
      "startup_count": 5
   },
   "translate_blocked_languages": [ "en" ],
   "translate_whitelists": {

   }
}' > /home/$1/.config/google-chrome/Default/Preferences
echo "Write operation completed!"
