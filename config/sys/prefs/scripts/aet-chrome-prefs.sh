#!/bin/bash
echo "Writing Aetna Chrome bookmarks..."
# CHROME BOOKMARK WRITE
echo '{
   "checksum": "74602d27aa46cd4cd2b5a7d1884d06a4",
   "roots": {
      "bookmark_bar": {
         "children": [ {
            "date_added": "13048689898255000",
            "id": "9",
            "name": "CallPro XE",
            "type": "url",
            "url": "http://cvty.web1.callproxe.com/cti/agents/"
         }, {
            "date_added": "13050550598150375",
            "id": "10",
            "name": "Citrix",
            "type": "url",
            "url": "https://vcib.aetna.com/vpn/index.html"
         }, {
            "date_added": "13048372974100750",
            "id": "4",
            "name": "Monet Anywhere",
            "type": "url",
            "url": "https://monetanywhere.wfmlive.com/login/login.aspx"
         }, {
            "date_added": "13048373003708750",
            "id": "5",
            "name": "ADP",
            "type": "url",
            "url": "https://workforcenow.adp.com/public/index.htm"
         }, {
            "date_added": "13060795513510625",
            "id": "14",
            "name": "Coventry Medicare: Home",
            "type": "url",
            "url": "http://coventry-medicare.coventryhealthcare.com/"
         }, {
            "date_added": "13060816005539500",
            "id": "15",
            "name": "DRX2015",
            "type": "url",
            "url": "https://aetna.destinationrx.com/PlanCompare/CallCenter/Type1/2015/Compare/Home?customtrack5=DP"
         } ],
         "date_added": "13048372906502625",
         "date_modified": "13060816005539500",
         "id": "1",
         "name": "Bookmarks bar",
         "type": "folder"
      },
      "other": {
         "children": [  ],
         "date_added": "13048372906502625",
         "date_modified": "0",
         "id": "2",
         "name": "Other bookmarks",
         "type": "folder"
      },
      "synced": {
         "children": [  ],
         "date_added": "13048372906502625",
         "date_modified": "0",
         "id": "3",
         "name": "Mobile bookmarks",
         "type": "folder"
      }
   },
   "version": 1
}' > /home/$1/.config/google-chrome/Default/Bookmarks
echo "Bookmark write operation completed!"

echo "Writing Chrome preferences..."
# Chrome Preferences
echo '{
   "apps": {
      "shortcuts_have_been_created": true
   },
   "autofill": {
      "enabled": false
   },
   "bookmark_bar": {
      "show_apps_shortcut": false,
      "show_on_all_tabs": true
   },
   "bookmark_editor": {
      "expanded_nodes": [  ]
   },
   "browser": {
      "check_default_browser": false,
      "clear_data": {
         "browsing_history": true,
         "cache": true,
         "content_licenses": true,
         "cookies": true,
         "download_history": true,
         "form_data": true,
         "hosted_apps_data": true,
         "passwords": true,
         "time_period": 4
      },
      "clear_lso_data_enabled": true,
      "last_clear_browsing_data_time": "13070653938712838",
      "last_known_google_url": "https://www.google.com/",
      "pepper_flash_settings_enabled": true,
      "window_placement": {
         "bottom": 867,
         "left": 161,
         "maximized": false,
         "right": 1189,
         "top": 40,
         "work_area_bottom": 991,
         "work_area_left": 0,
         "work_area_right": 1280,
         "work_area_top": 0
      }
   },
   "countryid_at_install": 21843,
   "data_reduction": {
      "daily_original_length": [ "0", "67655102", "91758857", "0", "63747000", "67724524", "0", "0", "54412394", "69156426", "0", "60955675", "47987872", "0", "0", "59138183", "0", "0", "0", "93131214", "20591856", "19622081", "0", "0", "0", "0", "0", "17098964", "17299473", "0", "0", "0", "0", "0", "9409257", "0", "4230911", "3434261", "0", "0", "0", "0", "0", "0", "0", "0", "2549458", "0", "0", "0", "415579", "0", "0", "0", "0", "0", "0", "0", "0", "4977596" ],
      "daily_original_length_via_data_reduction_proxy": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_original_length_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length": [ "0", "67655102", "91758857", "0", "63747000", "67724524", "0", "0", "54412394", "69156426", "0", "60955675", "47987872", "0", "0", "59138183", "0", "0", "0", "93131214", "20591856", "19622081", "0", "0", "0", "0", "0", "17098964", "17299473", "0", "0", "0", "0", "0", "9409257", "0", "4230911", "3434261", "0", "0", "0", "0", "0", "0", "0", "0", "2549458", "0", "0", "0", "415579", "0", "0", "0", "0", "0", "0", "0", "0", "4977596" ],
      "daily_received_length_https_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_long_bypass_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_short_bypass_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_unknown_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_via_data_reduction_proxy": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "daily_received_length_with_data_reduction_proxy_enabled": [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0" ],
      "last_update_date": "13070613600000000",
      "statistics_prefs_migrated": true
   },
   "default_apps_install_state": 3,
   "default_search_provider": {
      "enabled": true,
      "id": "2"
   },
   "distribution": {
      "make_chrome_default_for_user": true
   },
   "dns_prefetching": {
      "host_referral_list": [ 2, [ "http://a.disquscdn.com/", [ "http://a.disquscdn.com/", 4.4926858174239985 ] ], [ "http://disqus.com/", [ "http://a.disquscdn.com/", 6.125031858389638, "http://disqus.com/", 2.87228336212188, "http://referrer.disqus.com/", 3.4144081114998395, "http://www.google-analytics.com/", 2.33015861274392, "https://glitter-services.disqus.com/", 1.7880338633659603 ] ], [ "http://solutions.liveperson.com/", [ "http://a.disquscdn.com/", 2.87228336212188, "http://disqus.com/", 1.7880338633659603, "http://links.services.disqus.com/", 1.7880338633659603, "http://liveengage.disqus.com/", 1.7880338633659603, "http://referrer.disqus.com/", 1.7880338633659603, "http://solutions.liveperson.com/", 6.125031858389638, "http://www.google-analytics.com/", 2.33015861274392 ] ] ],
      "startup_list": [ 1, "http://a.disquscdn.com/", "http://disqus.com/", "http://links.services.disqus.com/", "http://liveengage.disqus.com/", "http://referrer.disqus.com/", "http://solutions.liveperson.com/", "http://www.google-analytics.com/", "https://glitter-services.disqus.com/" ]
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
         "last_check": "13068667168180000",
         "next_check": "13070654718872409"
      },
      "chrome_url_overrides": {
         "bookmarks": [ "chrome-extension://eemcgdkfndhakfknompkggombfjjjeno/main.html" ]
      },
      "commands": {

      },
      "install_signature": {
         "expire_date": "2015-01-06",
         "ids": [ "bepbmhgboaologfdajaanbcjmnhjmhfn" ],
         "invalid_ids": [  ],
         "salt": "GXACxBTow2UiHtbnpoDfcJIBsW9vMkli5tmy5uhQX/A=",
         "signature": "hp8Fnp/OS5TZEFBXybuVxhld5MbIY9BCtCDrfppyfc34DWZNy7xTORatWk4diDDY7k6C5zRe/AMbP6feQ2QDAFnORXvD35LsuKsrcvqsWuyT9L0sWZSvnRLWj9mjxAhnr8Ukg0GT8TJt6xlr/auEx7bf/27FQ8nIhkH+0gyi3sJLW6BM+CA9QT7qk7WRDiFFjbETVx/ptatyzRd2OBWz1AKQSdzSJdDc2S1ABu6HtQ8H5dDrHth8+Id9Q0bRV3aKYHu2ML4C9ckPHLWDstAbJ2z4RlKJy58c5sljj5Omnxn4uooWt9xgQMrSud/Qxiw0hmnQ48rhAceiLX7GysnDvg==",
         "signature_format_version": 2,
         "timestamp": "13057768857927500"
      },
      "last_chrome_version": "41.0.2272.89",
      "settings": {
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
            "install_time": "13069442863780777",
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
         "bepbmhgboaologfdajaanbcjmnhjmhfn": {
            "disable_reasons": 1,
            "state": 0
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
            "install_time": "13069442863788191",
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
            "install_time": "13069442863762855",
            "location": 5,
            "manifest": {
               "chrome_url_overrides": {
                  "bookmarks": "main.html"
               },
               "content_security_policy": "object-src none; script-src chrome://resources self",
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
            "install_time": "13069442863790827",
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
            "events": [ "feedbackPrivate.onFeedbackRequested", "runtime.onMessageExternal" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13069442863788918",
            "location": 5,
            "manifest": {
               "app": {
                  "background": {
                     "scripts": [ "js/event_handler.js" ]
                  },
                  "content_security_policy": "default-src none; script-src self chrome://resources; style-src unsafe-inline *; img-src *; media-src self"
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
               "api": [ "cryptotokenPrivate", "externally_connectable.all_urls", "hid", "tabs", "u2fDevices", "usb", {
                  "usbDevices": [ {
                     "interfaceId": -1,
                     "productId": 529,
                     "vendorId": 4176
                  } ]
               }, "webConnectable" ],
               "explicit_host": [ "http://*/*", "https://*/*", "https://www.gstatic.com/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [ "runtime.onConnectExternal", "runtime.onMessageExternal" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13070653886515700",
            "location": 5,
            "manifest": {
               "background": {
                  "persistent": false,
                  "scripts": [ "util.js", "b64.js", "sha256.js", "countdown.js", "countdowntimer.js", "devicestatuscodes.js", "approvedorigins.js", "errorcodes.js", "gnubbycodetypes.js", "webrequest.js", "gnubbymsgtypes.js", "messagetypes.js", "factoryregistry.js", "closeable.js", "requesthelper.js", "webrequestsender.js", "enroller.js", "requestqueue.js", "signer.js", "origincheck.js", "textfetcher.js", "appid.js", "watchdog.js", "etld_names_list.js", "etld.js", "etldorigincheck.js", "cryptotokenapprovedorigins.js", "gnubbydevice.js", "hidgnubbydevice.js", "usbgnubbydevice.js", "gnubbies.js", "gnubby.js", "gnubby-u2f.js", "gnubbyfactory.js", "singlesigner.js", "multiplesigner.js", "generichelper.js", "inherits.js", "individualattest.js", "devicefactoryregistry.js", "usbhelper.js", "usbenrollhandler.js", "usbsignhandler.js", "usbgnubbyfactory.js", "googlecorpindividualattest.js", "cryptotokenbackground.js" ]
               },
               "description": "CryptoToken Component Extension",
               "externally_connectable": {
                  "accepts_tls_channel_id": true,
                  "ids": [ "fjajfjhkeibgmiggdfehjplbhmfkialk" ],
                  "matches": [ "\u003Call_urls>" ]
               },
               "incognito": "split",
               "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq7zRobvA+AVlvNqkHSSVhh1sEWsHSqz4oR/XptkDe/Cz3+gW9ZGumZ20NCHjaac8j1iiesdigp8B1LJsd/2WWv2Dbnto4f8GrQ5MVphKyQ9WJHwejEHN2K4vzrTcwaXqv5BSTXwxlxS/mXCmXskTfryKTLuYrcHEWK8fCHb+0gvr8b/kvsi75A1aMmb6nUnFJvETmCkOCPNX5CHTdy634Ts/x0fLhRuPlahk63rdf7agxQv5viVjQFk+tbgv6aa9kdSd11Js/RZ9yZjrFgHOBWgP4jTBqud4+HUglrzu8qynFipyNRLCZsaxhm+NItTyNgesxLdxZcwOz56KD1Q4IQIDAQAB",
               "manifest_version": 2,
               "name": "CryptoTokenExtension",
               "permissions": [ "hid", "usb", "cryptotokenPrivate", "externally_connectable.all_urls", "tabs", "u2fDevices", "https://*/*", "http://*/*", {
                  "usbDevices": [ {
                     "productId": 529,
                     "vendorId": 4176
                  } ]
               } ],
               "version": "0.9.10"
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
         "lccekmodgklaepjeofjdjpbminllajkg": {
            "ack_external": true,
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "install_time": "13070653887508631",
            "lastpingday": "13070617200941174",
            "location": 10,
            "manifest": {
               "description": "Support files for Chrome Hotwording.",
               "export": {
                  "resources": [ "audio/*", "_platform_specific/*", "hotword_*.nmf" ],
                  "whitelist": [ "nbpagnldghgfoolbancepceaanlmhfmd" ]
               },
               "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoxhwmnepSrtvEcatE9K4SxOUTy6U1LNpuaT3BNr12cuehQT5YAGeUcgeIMQmE0/h/EefU53TcjUEn9vgE8+aSZW0VirROE36hfcWpqyxf9jh0mPRluLIxCW+ObD/B5YoXj0kxTWIaDQqKYBJyo+QCRwef5hwfAoUoDggnYDRHHG4z3mfZJ4duY2H3ISEw4/tsvAm8SxCZm+W6laCV0AkJxO+s4bNNC0z0Y5+G3nw24uV8cdMnfQcFUWJncnwqDSTUp7vOZb570Wv02TD+qhpA2rlF0/ym6edXoKzapR4+SQQllDXZ0yLZ3GQ6uf7IsCufSoYPoIsmYExHrlZbgVkWwIDAQAB",
               "manifest_version": 2,
               "minimum_chrome_version": "39",
               "name": "Chrome Hotword Shared Module",
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
                  "lang": "en-AU",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_en-au/"
               }, {
                  "lang": "en-AU",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_en-au/"
               }, {
                  "lang": "en-AU",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_en-au/"
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
                  "lang": "es",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_es/"
               }, {
                  "lang": "es",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_es/"
               }, {
                  "lang": "es",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_es/"
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
                  "lang": "it",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_it/"
               }, {
                  "lang": "it",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_it/"
               }, {
                  "lang": "it",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_it/"
               }, {
                  "lang": "ja",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_ja/"
               }, {
                  "lang": "ja",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_ja/"
               }, {
                  "lang": "ja",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_ja/"
               }, {
                  "lang": "ko",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_ko/"
               }, {
                  "lang": "ko",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_ko/"
               }, {
                  "lang": "ko",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_ko/"
               }, {
                  "lang": "pt-BR",
                  "nacl_arch": "arm",
                  "sub_package_path": "_platform_specific/arm_pt-br/"
               }, {
                  "lang": "pt-BR",
                  "nacl_arch": "x86-32",
                  "sub_package_path": "_platform_specific/x86-32_pt-br/"
               }, {
                  "lang": "pt-BR",
                  "nacl_arch": "x86-64",
                  "sub_package_path": "_platform_specific/x86-64_pt-br/"
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
               "version": "0.3.0.2"
            },
            "path": "lccekmodgklaepjeofjdjpbminllajkg/0.3.0.2_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": true,
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
            "install_time": "13069442863780092",
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
            "install_time": "13069442863781401",
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
         "nbpagnldghgfoolbancepceaanlmhfmd": {
            "active_permissions": {
               "api": [ "audioCapture", "hotwordPrivate", "idle", "management", "metricsPrivate", "tabs", "unlimitedStorage" ],
               "explicit_host": [ "*://*.google.co.uk/*", "*://*.google.com/*", "*://*.google.de/*", "*://*.google.fr/*", "*://*.google.ru/*", "chrome://newtab/*", "chrome://resources/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 1,
            "events": [ "hotwordPrivate.onEnabledChanged", "management.onInstalled", "runtime.onStartup" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13070653886505073",
            "location": 5,
            "manifest": {
               "background": {
                  "persistent": false,
                  "scripts": [ "chrome://resources/js/cr.js", "chrome://resources/js/util.js", "chrome://resources/js/cr/event_target.js", "constants.js", "keep_alive.js", "logging.js", "metrics.js", "nacl_manager.js", "state_manager.js", "base_session_manager.js", "always_on_manager.js", "launcher_manager.js", "page_audio_manager.js", "training_manager.js", "manager.js" ]
               },
               "content_security_policy": "object-src ''none''; script-src chrome://resources ''self''",
               "import": [ {
                  "id": "lccekmodgklaepjeofjdjpbminllajkg"
               } ],
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDbHXRPiq2De9EJ+4pvNN6uE/D2avxrqyLSpA/Hq3II+btkPl1gboY3oUPTfevpVOFa90Y1c1b3/W682dXqybT0klIvFLKhdQx0LiVqSUQyIaDrwOCSo/ZcukbEwDRojegWymCjHvX6WZk4kKZzTJYzY1vrp0TWKLhttEMN9KFmowIDAQAB",
               "manifest_version": 2,
               "minimum_chrome_version": "38",
               "name": "Hotword triggering",
               "permissions": [ "*://*.google.com/*", "*://*.google.ru/*", "*://*.google.co.uk/*", "*://*.google.fr/*", "*://*.google.de/*", "chrome://newtab/", "chrome://resources/", "audioCapture", "hotwordPrivate", "idle", "management", "metricsPrivate", "tabs", "unlimitedStorage" ],
               "version": "0.0.1.3"
            },
            "path": "/opt/google/chrome/resources/hotword",
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
            "install_time": "13069442863791456",
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
            "events": [ "runtime.onConnectExternal", "runtime.onMessageExternal" ],
            "from_bookmark": false,
            "from_webstore": false,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13069442863782031",
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
               "explicit_host": [ "https://wallet-web.sandbox.google.com/*", "https://wallet.google.com/*", "https://www.google.com/*", "https://www.googleapis.com/*" ],
               "manifest_permissions": [  ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 137,
            "events": [ "app.runtime.onLaunched", "runtime.onConnectExternal" ],
            "from_bookmark": false,
            "from_webstore": true,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13070653907320806",
            "lastpingday": "13070617200941174",
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
               "permissions": [ "identity", "webview", "https://wallet.google.com/", "https://wallet-web.sandbox.google.com/", "https://www.google.com/", "https://www.googleapis.com/*" ],
               "update_url": "https://clients2.google.com/service/update2/crx",
               "version": "0.1.0.0"
            },
            "path": "nmmhkkegccagdldgiimedpiccmgmieda/0.1.0.0_1",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "running": false,
            "state": 1,
            "was_installed_by_default": true,
            "was_installed_by_oem": false
         },
         "pidcjgldchekcoolelhbjfbnccjkckfj": {
            "active_permissions": {
               "api": [  ],
               "manifest_permissions": [  ],
               "scriptable_host": [ "http://*/*", "https://*/*" ]
            },
            "commands": {

            },
            "content_settings": [  ],
            "creation_flags": 9,
            "events": [  ],
            "from_bookmark": false,
            "from_webstore": true,
            "granted_permissions": {
               "api": [  ],
               "manifest_permissions": [  ],
               "scriptable_host": [ "http://*/*", "https://*/*" ]
            },
            "incognito": true,
            "incognito_content_settings": [  ],
            "incognito_preferences": {

            },
            "initial_keybindings_set": true,
            "install_time": "13070653906358578",
            "location": 1,
            "manifest": {
               "content_scripts": [ {
                  "all_frames": true,
                  "js": [ "jquery.js", "content.js" ],
                  "matches": [ "http://*/*", "https://*/*" ]
               } ],
               "description": "Stop Backspace returning to previous page.",
               "icons": {
                  "128": "logo128.png",
                  "16": "logo16.png",
                  "48": "logo48.png"
               },
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCY2+5Yle3nolkc4YQ5gn6JmFQfwFrZEP9hJLCYH8X7I9ot/Hkifuq6JJK9JP8cg66rmiz9pT/MV0lssNpk8yVumZ2Uq4U15saopEukiRfh/mWrEnZg3yG1mKxaOAbBn3n5eDwE+7ZkWBQtZgZWOb8wvvGp/3bpU9J2KNFwCDXHNwIDAQAB",
               "manifest_version": 2,
               "name": "BackStop",
               "update_url": "http://clients2.google.com/service/update2/crx",
               "version": "2.0.1"
            },
            "path": "pidcjgldchekcoolelhbjfbnccjkckfj/2.0.1_0",
            "preferences": {

            },
            "regular_only_preferences": {

            },
            "state": 1,
            "was_installed_by_default": false,
            "was_installed_by_oem": false
         }
      }
   },
   "hotword": {
      "previous_language": "en-US"
   },
   "http_original_content_length": "2716058344",
   "http_received_content_length": "2716058344",
   "intl": {
      "accept_languages": "en-US,en"
   },
   "invalidator": {
      "client_id": "wrnYdamiVQ0SukjC03KT3w=="
   },
   "media": {
      "device_id_salt": "gbtuaYiL09aHWlRGKQtrmQ=="
   },
   "net": {
      "http_server_properties": {
         "servers": {
            "quic.global.props:0": {
               "supports_quic": {
                  "address": "192.168.1.176",
                  "used_quic": true
               }
            },
            "www.google-analytics.com:80": {
               "alternate_protocol": {
                  "port": 80,
                  "probability": 0.08,
                  "protocol_str": "quic"
               }
            }
         },
         "version": 3
      }
   },
   "pinned_tabs": [  ],
   "plugins": {
      "migrated_to_pepper_flash": true,
      "plugins_list": [  ],
      "removed_old_component_pepper_flash_settings": true
   },
   "profile": {
      "avatar_index": 0,
      "content_settings": {
         "clear_on_exit_migrated": true,
         "pattern_pairs": {
            "https://[*.]vcib.aetna.com:443,*": {
               "plugins": 1
            }
         },
         "pref_version": 1
      },
      "exit_type": "Normal",
      "exited_cleanly": true,
      "icon_version": 3,
      "local_profile_id": 9448027,
      "managed_user_id": "",
      "name": "First user",
      "password_manager_enabled": false,
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
               "ahfgeienlihckogmohjhadlkjgocpleb": "53B3A2A9987343E67E49C626D6FF6811C12466794AF3D409B9320A6ADB8E510B",
               "bepbmhgboaologfdajaanbcjmnhjmhfn": "1AF5697DC58855220EC37C72526ED6ADDC2D3D47161F97F5D99B6A849DB352D6",
               "dnhpdliibojhegemfjheidglijccjfmc": "889AC1A9FF9364A3DDA18009AA0DA127054BEA0B7A90FC1533CBE77420EC55D4",
               "eemcgdkfndhakfknompkggombfjjjeno": "D9ED67B778EC55A2ADA112D4295902BC20C40EC1C72EC62222CBE08DD0FEFD53",
               "ennkphjdgehloodpbhlhldgbnhmacadg": "34C5ED1064FDF2D8E13FC912802E1F5064E4A634511999A82DD1896C5A13BF78",
               "gfdkimpbcpahaombhbimeihdjnejgicl": "0DAE08591A147ADFE54C6E2D3672B835B76B2239D60ECB413201B077EE5A9464",
               "kmendfapggjehodndflmmgagdbamhnfd": "8F3FC33AE6A28D305AE14B3444F18090948C53CA1F0DB7D73B0BA27A0349205C",
               "lccekmodgklaepjeofjdjpbminllajkg": "31A15E0A09987227565AD57659AF2F092D34EB653C960EA2F1F8035EC10B99E2",
               "mfehgcgbbipciphmccgaenjidiccnmng": "33F953E22B6A538DB8735B7B20EC88D29A1F4786548F5B7619B2E39D7EBAA4CA",
               "mgndgikekgjfcpckkfioiadnlibdjbkf": "F021A7A0CD24592196A5B8BE76C31C1C8E90FAD377F902524C6F14FDA9AF1D60",
               "nbpagnldghgfoolbancepceaanlmhfmd": "3AC5046FBDEBD9521E364047B6BA115AA433C3D0C6EF5CB838A0088FF5A4352E",
               "neajdppkdcdipfabeoofebfddakdcjhd": "7ADA1465DDC97C92EF4AE5F5E5BC24E87C73C52F28BCB3323193D8888E873596",
               "nkeimhogjdpnpccoofpliimaahmaaome": "6676B26274F09464C25A68CF6D90CD88AE620C3E68FE6F009420643CBA087EE6",
               "nmmhkkegccagdldgiimedpiccmgmieda": "BE10E9ACB3D1FB9695CC4184B2CE56509E23207CA2E334A530DB95D8B4E3C083",
               "pidcjgldchekcoolelhbjfbnccjkckfj": "8ABF4447962FEC7D3A60A1CD0B8D91DA244B816C2A59E0DDCABD5D337077C564"
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
            "incidents_sent": "F1827D0C55798CE7843DAF5DDEAB06A9BB2F9628970A5DCDA2543102436E4749"
         },
         "search_provider_overrides": "99AC1EA12DA6196886F08A934B3B5006A725063DF41E9D0EE38F1FCFFDFDD5B0",
         "session": {
            "restore_on_startup": "7BADFD2212B8A15263FDE51964FD3BAA8E29BF70E76A05BFC8C68CFFEE5706AA",
            "startup_urls": "5C12279E6360F1741A483023FD6F557CF6B97CA4422E52FF58C2D932A0CD4508"
         },
         "sync": {
            "remaining_rollback_tries": "C5BA99F3AF8531F0B21BED59CABAED66DCF7D7A298AFA1BD4D59BF414F8F09BA"
         }
      }
   },
   "proxy": {
      "bypass_list": "",
      "mode": "system",
      "server": ""
   },
   "savefile": {
      "default_directory": "/home/tagent/Downloads"
   },
   "session": {
      "restore_on_startup": 4,
      "restore_on_startup_migrated": true,
      "startup_urls": [ "http://cvty.web1.callproxe.com/cti/agents/" ],
      "startup_urls_migration_time": "13048364345494000"
   },
   "sync_promo": {
      "startup_count": 10
   },
   "translate_accepted_count": {
      "fr": 0
   },
   "translate_blocked_languages": [ "en" ],
   "translate_denied_count": {
      "fr": 1
   },
   "translate_last_denied_time": 1421793585208.75,
   "translate_whitelists": {

   },
   "zerosuggest": {
      "cachedresults": ""
   }
}' > /home/$1/.config/google-chrome/Default/Preferences
echo "Preferences write operation completed!"
