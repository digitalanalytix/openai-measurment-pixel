# OpenAI Measurement Pixel — GTM Template

Google Tag Manager Community Template for the [OpenAI Ads Measurement Pixel](https://developers.openai.com/ads/measurement-pixel).

## Features

- **Initialization mode** — loads the SDK and configures the pixel with your Pixel ID
- **Event mode** — tracks all 10 standard events + custom events
- **Consent Mode v2** — respects `ad_storage` consent state
- **User identity matching** — optional email and external ID with automatic SHA-256 hashing
- **Contents support** — manual table or GTM variable for product/item data
- **Deduplication** — optional `event_id` for browser + server dedup

## Supported Events

| Event | Type | Description |
|-------|------|-------------|
| `page_viewed` | contents | User lands on a page |
| `contents_viewed` | contents | User views a product or content |
| `items_added` | contents | User adds items to cart |
| `checkout_started` | contents | User starts checkout |
| `order_created` | contents | Purchase completed |
| `lead_created` | customer_action | Lead form submitted |
| `registration_completed` | customer_action | Account registration finished |
| `appointment_scheduled` | customer_action | Meeting or demo booked |
| `subscription_created` | plan_enrollment | Paid subscription started |
| `trial_started` | plan_enrollment | Free trial started |
| Custom | custom | User-defined event |

## Setup

### 1. Add the Initialization Tag

1. In GTM, create a new tag using the **OpenAI Measurement Pixel** template
2. Set Tag Type to **Initialization**
3. Enter your **Pixel ID** from the OpenAI Ads Manager
4. Optionally configure user data fields for identity matching
5. Set the trigger to **All Pages** (or a consent-gated equivalent)

### 2. Add Event Tags

1. Create another tag using the same template
2. Set Tag Type to **Event**
3. Select the event name from the dropdown
4. Configure event data (amount, currency, contents, etc.)
5. Set appropriate triggers (e.g., purchase confirmation page)

### 3. Firing Order

The Initialization tag **must fire before** any Event tags. Use GTM's tag sequencing or ensure your triggers respect this order.

## User Data & Hashing

The template can automatically SHA-256 hash email addresses and external IDs. Provide the plain value and leave the "already hashed" checkbox unchecked. The template will trim, lowercase, and hash the value before sending it to the SDK.

If you're providing pre-hashed values, check the "already hashed" box.

## Contents Data

For events that support contents (product/item data), you can provide data two ways:

- **GTM Variable** — point to a variable that returns an array of content objects
- **Manual Table** — enter items directly in the tag configuration

Each content item supports: `id`, `name`, `content_type`, `quantity`, `amount`, `currency`.

## License

Apache 2.0 — see [LICENSE](LICENSE).
