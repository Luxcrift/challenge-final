#!/bin/bash
# set -x
BOT_URL="https://api.telegram.org/bot6124937865:AAEcUK3JnB_YW65I2TGUl1flSddvAMHP058/sendMessage"
TELEGRAM_CHAT_ID="1692690779"
# Set formatting
PARSE_MODE="Markdown"
COMMIT=$(git log -1 --pretty=format:"%s")
BUILD_STATUS="SUCCESS"
VERSION1=`jq -r '.version' ./frontend/package.json`
VERSION2=`jq -r '.version' ./products/package.json`
VERSION3=`jq -r '.version' ./shopping-cart/package.json`
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REPO=${GITHUB_REPOSITORY}

# Send message function
send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=$TELEGRAM_CHAT_ID \
        -d text="$1" -d parse_mode=${PARSE_MODE}
}

# Call send message with the message
send_msg "
\`-----------------------------------------------------------\`
Deploy 🚀*${BUILD_STATUS}!*
\`Repository 📦:  ${REPO}\`
\`Branch 🏷:       ${BRANCH}\`
\`Version Frontend ✅:           ${VERSION1}\`
\`Version Products ✅:           ${VERSION2}\`
\`Version Shopping-Cart ✅:      ${VERSION3}\`
\`Autor ✅:      ${GITHUB_ACTOR}\`
*Commit Msg 💭:*
_${COMMIT}_
[Job Log view here 🤟]("hola")
\`-----------------------------------------------------------\`
"
