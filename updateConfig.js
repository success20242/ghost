const fs = require("fs");

const configFile = "config.production.json";

// Ensure file exists
if (!fs.existsSync(configFile)) {
  console.error(`❌ Config file ${configFile} not found`);
  process.exit(1);
}

const contents = fs.readFileSync(configFile, "utf8");
let config;

try {
  config = JSON.parse(contents);
} catch (err) {
  console.error("❌ Failed to parse config.production.json:", err.message);
  process.exit(1);
}

// Use Fly.io URL (or fallback)
const externalURL = process.env.URL || process.env.RENDER_EXTERNAL_URL;

if (externalURL) {
  config.url = externalURL;
  fs.writeFileSync(configFile, JSON.stringify(config, null, 2));
  console.log(`✅ Updated config.url to ${externalURL}`);
} else {
  console.warn("⚠️ No external URL found in environment variables.");
}
