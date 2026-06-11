___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OpenAI Measurement Pixel",
  "categories": [
    "ADVERTISING",
    "CONVERSIONS"
  ],
  "brand": {
    "id": "brand_digitalanalytix",
    "displayName": "DigitalAnalytix"
  },
  "description": "Official Google Tag Manager template for the OpenAI Ads Measurement Pixel. Supports initialization, all standard events, custom events, user identity matching, and Consent Mode v2.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "tagType",
    "displayName": "Tag Type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "init",
        "displayValue": "Initialization"
      },
      {
        "value": "event",
        "displayValue": "Event"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "init",
    "help": "Select \u003cb\u003eInitialization\u003c/b\u003e to load the SDK and configure the pixel. Select \u003cb\u003eEvent\u003c/b\u003e to track conversions. The Initialization tag must fire before any Event tags."
  },
  {
    "type": "TEXT",
    "name": "pixelId",
    "displayName": "Pixel ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your OpenAI Pixel ID from the Ads Manager conversions tab.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "debug",
    "checkboxText": "Enable debug mode",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Log SDK activity to the browser console.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "User Data (Optional)",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "userEmail",
        "displayName": "Email",
        "simpleValueType": true,
        "help": "Email address for identity matching. Will be trimmed, lowercased, and SHA-256 hashed unless already hashed."
      },
      {
        "type": "CHECKBOX",
        "name": "emailAlreadyHashed",
        "checkboxText": "Email is already SHA-256 hashed",
        "simpleValueType": true,
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "userEmail",
            "paramValue": "",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "userExternalId",
        "displayName": "External ID",
        "simpleValueType": true,
        "help": "A stable customer identifier. Will be SHA-256 hashed unless already hashed."
      },
      {
        "type": "CHECKBOX",
        "name": "externalIdAlreadyHashed",
        "checkboxText": "External ID is already SHA-256 hashed",
        "simpleValueType": true,
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "userExternalId",
            "paramValue": "",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "userCountry",
        "displayName": "Country",
        "simpleValueType": true,
        "help": "Two-letter ISO 3166-1 country code (e.g. US, GB, DE)."
      },
      {
        "type": "TEXT",
        "name": "userCity",
        "displayName": "City",
        "simpleValueType": true,
        "help": "City name, max 128 characters. Will be trimmed and lowercased."
      },
      {
        "type": "TEXT",
        "name": "userZipCode",
        "displayName": "Zip Code",
        "simpleValueType": true,
        "help": "Postal/zip code, max 32 characters."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "eventName",
    "displayName": "Event Name",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "page_viewed",
        "displayValue": "Page Viewed"
      },
      {
        "value": "contents_viewed",
        "displayValue": "Contents Viewed"
      },
      {
        "value": "items_added",
        "displayValue": "Items Added"
      },
      {
        "value": "checkout_started",
        "displayValue": "Checkout Started"
      },
      {
        "value": "order_created",
        "displayValue": "Order Created"
      },
      {
        "value": "lead_created",
        "displayValue": "Lead Created"
      },
      {
        "value": "registration_completed",
        "displayValue": "Registration Completed"
      },
      {
        "value": "appointment_scheduled",
        "displayValue": "Appointment Scheduled"
      },
      {
        "value": "subscription_created",
        "displayValue": "Subscription Created"
      },
      {
        "value": "trial_started",
        "displayValue": "Trial Started"
      },
      {
        "value": "custom",
        "displayValue": "Custom Event"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "page_viewed",
    "help": "Select the event to track.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "customEventName",
    "displayName": "Custom Event Name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9][a-zA-Z0-9_\\-]{0,62}[a-zA-Z0-9]$"
        ]
      }
    ],
    "help": "1-64 characters. Letters, numbers, underscores, dashes. Must start and end with a letter or number.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "custom",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "amount",
    "displayName": "Amount",
    "simpleValueType": true,
    "help": "Monetary value as integer in the currency\u0027s lowest denomination (e.g. 12999 for $129.99).",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "currency",
    "displayName": "Currency",
    "simpleValueType": true,
    "help": "ISO 4217 currency code (e.g. USD, EUR, GBP). Required when Amount is set.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "planId",
    "displayName": "Plan ID",
    "simpleValueType": true,
    "help": "Your internal plan identifier.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "page_viewed",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "contents_viewed",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "items_added",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "checkout_started",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "order_created",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "lead_created",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "registration_completed",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "appointment_scheduled",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "contentsGroup",
    "displayName": "Contents",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "contentsSource",
        "displayName": "Contents Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "manual",
            "displayValue": "Manual Table"
          },
          {
            "value": "variable",
            "displayValue": "GTM Variable"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "variable",
        "help": "Choose how to provide contents data. Use \u003cb\u003eGTM Variable\u003c/b\u003e for dynamic data (recommended) or \u003cb\u003eManual Table\u003c/b\u003e for static values."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "contentsTable",
        "displayName": "Contents Items",
        "newRowButtonText": "Add Item",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Item ID",
            "name": "id",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Name",
            "name": "name",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Content Type",
            "name": "content_type",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Quantity",
            "name": "quantity",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Amount",
            "name": "amount",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Currency",
            "name": "currency",
            "type": "TEXT"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "contentsSource",
            "paramValue": "manual",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "contentsVariable",
        "displayName": "Contents Variable",
        "simpleValueType": true,
        "help": "A GTM variable that returns an array of content objects. Each object may have: id, name, content_type, quantity, amount, currency.",
        "enablingConditions": [
          {
            "paramName": "contentsSource",
            "paramValue": "variable",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "lead_created",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "registration_completed",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "appointment_scheduled",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "subscription_created",
        "type": "NOT_EQUALS"
      },
      {
        "paramName": "eventName",
        "paramValue": "trial_started",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "optionsGroup",
    "displayName": "Options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "eventId",
        "displayName": "Event ID",
        "simpleValueType": true,
        "help": "Unique identifier for deduplication between browser and server events."
      },
      {
        "type": "CHECKBOX",
        "name": "optOut",
        "checkboxText": "Opt out of personalization",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "When checked, the event will not be used for ad personalization."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const createArgumentsQueue = require('createArgumentsQueue');
const makeInteger = require('makeInteger');
const makeString = require('makeString');
const sha256 = require('sha256');
const isConsentGranted = require('isConsentGranted');
const addConsentListener = require('addConsentListener');
const getType = require('getType');

const SDK_URL = 'https://bzrcdn.openai.com/sdk/oaiq.min.js';

let done = false;

function onSuccess() {
  if (!done) {
    done = true;
    data.gtmOnSuccess();
  }
}

function onFailure() {
  if (!done) {
    done = true;
    data.gtmOnFailure();
  }
}

if (!isConsentGranted('ad_storage')) {
  let listenerCalled = false;
  addConsentListener('ad_storage', function(consentType, granted) {
    if (granted && !listenerCalled) {
      listenerCalled = true;
      main();
    }
  });
  onSuccess();
  return;
}

main();

function main() {
  if (data.tagType === 'init') {
    runInit();
  } else {
    runEvent();
  }
}

function runInit() {
  createArgumentsQueue('oaiq', 'oaiq.q');

  buildUserData(function(user) {
    const config = { pixelId: makeString(data.pixelId) };

    if (data.debug) {
      config.debug = true;
    }

    if (user) {
      config.user = user;
    }

    callInWindow('oaiq', 'init', config);

    injectScript(SDK_URL, onSuccess, function() {
      log('OpenAI Pixel: Failed to load SDK');
      onFailure();
    }, 'oaiqSdk');
  });
}

function buildUserData(callback) {
  const user = {};
  let hasData = false;
  let pending = 0;
  let collected = false;

  const maybeDone = function() {
    if (collected && pending === 0) {
      callback(hasData ? user : null);
    }
  };

  if (data.userEmail) {
    hasData = true;
    if (data.emailAlreadyHashed) {
      user.email_sha256 = makeString(data.userEmail);
    } else {
      pending++;
      sha256(makeString(data.userEmail).trim().toLowerCase(), function(hash) {
        user.email_sha256 = hash;
        pending--;
        maybeDone();
      }, { outputEncoding: 'hex' });
    }
  }

  if (data.userExternalId) {
    hasData = true;
    if (data.externalIdAlreadyHashed) {
      user.external_id_sha256 = makeString(data.userExternalId);
    } else {
      pending++;
      sha256(makeString(data.userExternalId), function(hash) {
        user.external_id_sha256 = hash;
        pending--;
        maybeDone();
      }, { outputEncoding: 'hex' });
    }
  }

  if (data.userCountry) {
    hasData = true;
    user.country = makeString(data.userCountry);
  }

  if (data.userCity) {
    hasData = true;
    user.city = makeString(data.userCity).trim().toLowerCase();
  }

  if (data.userZipCode) {
    hasData = true;
    user.zip_code = makeString(data.userZipCode);
  }

  collected = true;
  maybeDone();
}

function runEvent() {
  const oaiq = copyFromWindow('oaiq');
  if (!oaiq) {
    log('OpenAI Pixel: SDK not initialized. Fire the Initialization tag first.');
    onFailure();
    return;
  }

  const eventName = data.eventName;
  const eventData = buildEventData(eventName);
  const options = buildOptions(eventName);

  if (options) {
    callInWindow('oaiq', 'measure', eventName, eventData, options);
  } else {
    callInWindow('oaiq', 'measure', eventName, eventData);
  }

  onSuccess();
}

function buildEventData(eventName) {
  const contentsEvents = ['page_viewed', 'contents_viewed', 'items_added', 'checkout_started', 'order_created'];
  const customerActionEvents = ['lead_created', 'registration_completed', 'appointment_scheduled'];
  const planEvents = ['subscription_created', 'trial_started'];

  var eventData = {};

  if (contentsEvents.indexOf(eventName) >= 0) {
    eventData.type = 'contents';
  } else if (customerActionEvents.indexOf(eventName) >= 0) {
    eventData.type = 'customer_action';
  } else if (planEvents.indexOf(eventName) >= 0) {
    eventData.type = 'plan_enrollment';
  } else if (eventName === 'custom') {
    eventData.type = 'custom';
  }

  if (data.amount) {
    eventData.amount = makeInteger(data.amount);
  }

  if (data.currency) {
    eventData.currency = makeString(data.currency);
  }

  if (data.planId) {
    eventData.plan_id = makeString(data.planId);
  }

  var contents = getContents();
  if (contents && contents.length > 0) {
    eventData.contents = contents;
  }

  return eventData;
}

function getContents() {
  if (data.contentsSource === 'variable' && data.contentsVariable) {
    var varValue = data.contentsVariable;
    if (getType(varValue) === 'array') {
      return varValue;
    }
    return null;
  }

  if (data.contentsSource === 'manual' && data.contentsTable && data.contentsTable.length > 0) {
    var items = [];
    for (var i = 0; i < data.contentsTable.length; i++) {
      var row = data.contentsTable[i];
      var item = {};
      if (row.id) item.id = makeString(row.id);
      if (row.name) item.name = makeString(row.name);
      if (row.content_type) item.content_type = makeString(row.content_type);
      if (row.quantity) item.quantity = makeInteger(row.quantity);
      if (row.amount) item.amount = makeInteger(row.amount);
      if (row.currency) item.currency = makeString(row.currency);
      items.push(item);
    }
    return items;
  }

  return null;
}

function buildOptions(eventName) {
  var options = {};
  var hasOptions = false;

  if (data.eventId) {
    options.event_id = makeString(data.eventId);
    hasOptions = true;
  }

  if (eventName === 'custom' && data.customEventName) {
    options.custom_event_name = makeString(data.customEventName);
    hasOptions = true;
  }

  if (data.optOut) {
    options.opt_out = true;
    hasOptions = true;
  }

  return hasOptions ? options : null;
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://bzrcdn.openai.com/sdk/oaiq.min.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "oaiq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "oaiq.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Init tag fires and loads SDK
  code: |-
    const mockData = {
      tagType: 'init',
      pixelId: 'test-pixel-123',
      debug: false
    };

    mock('isConsentGranted', function() { return true; });

    let injectedUrl;
    mock('injectScript', function(url, onSuccess) {
      injectedUrl = url;
      onSuccess();
    });

    let initArgs;
    mock('callInWindow', function() {
      initArgs = arguments;
    });

    mock('createArgumentsQueue', function() {});

    runCode(mockData);

    assertThat(injectedUrl).isEqualTo('https://bzrcdn.openai.com/sdk/oaiq.min.js');
    assertThat(initArgs[1]).isEqualTo('init');
    assertThat(initArgs[2].pixelId).isEqualTo('test-pixel-123');
    assertApi('gtmOnSuccess').wasCalled();
- name: Event tag sends page_viewed
  code: |-
    const mockData = {
      tagType: 'event',
      eventName: 'page_viewed'
    };

    mock('isConsentGranted', function() { return true; });
    mock('copyFromWindow', function() { return function() {}; });

    let measureArgs;
    mock('callInWindow', function() {
      measureArgs = arguments;
    });

    runCode(mockData);

    assertThat(measureArgs[0]).isEqualTo('oaiq');
    assertThat(measureArgs[1]).isEqualTo('measure');
    assertThat(measureArgs[2]).isEqualTo('page_viewed');
- name: Event tag sends custom event with options
  code: |-
    const mockData = {
      tagType: 'event',
      eventName: 'custom',
      customEventName: 'my_event',
      amount: '5000',
      currency: 'USD',
      eventId: 'evt-123',
      optOut: true
    };

    mock('isConsentGranted', function() { return true; });
    mock('copyFromWindow', function() { return function() {}; });

    let measureArgs;
    mock('callInWindow', function() {
      measureArgs = arguments;
    });

    runCode(mockData);

    assertThat(measureArgs[2]).isEqualTo('custom');
    assertThat(measureArgs[3].type).isEqualTo('custom');
    assertThat(measureArgs[3].amount).isEqualTo(5000);
    assertThat(measureArgs[3].currency).isEqualTo('USD');
    assertThat(measureArgs[4].custom_event_name).isEqualTo('my_event');
    assertThat(measureArgs[4].event_id).isEqualTo('evt-123');
    assertThat(measureArgs[4].opt_out).isTrue();
- name: Tag waits for consent before firing
  code: |-
    const mockData = {
      tagType: 'init',
      pixelId: 'test-pixel-123'
    };

    mock('isConsentGranted', function() { return false; });

    let consentCallback;
    mock('addConsentListener', function(type, cb) {
      consentCallback = cb;
    });

    runCode(mockData);

    assertThat(consentCallback).isDefined();
- name: Event tag fails without SDK
  code: |-
    const mockData = {
      tagType: 'event',
      eventName: 'page_viewed'
    };

    mock('isConsentGranted', function() { return true; });
    mock('copyFromWindow', function() { return undefined; });

    runCode(mockData);

    assertApi('gtmOnFailure').wasCalled();


___NOTES___

OpenAI Measurement Pixel tag template for Google Tag Manager.
https://developers.openai.com/ads/measurement-pixel


